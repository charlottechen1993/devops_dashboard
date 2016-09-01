require 'octokit'
require 'action_view'
include ActionView::Helpers::DateHelper

config = YAML::load_file('github.yml')

Octokit.configure do |c|
  c.auto_paginate = true
  c.login = config["login"]
  c.password = config["password"]
end


SCHEDULER.every '1m', :first_in => 0 do |job|
    config["repos"].each do |name|
    r = Octokit::Client.new.repository(name)
    pulls = Octokit.pulls(name, :state => 'open').count
    
    # get number of commits per repo
    puts name
    commit_array = Octokit.commits_since(name,'2016-08-30')
    commit_num = commit_array.length
    
    # get number of forks per repo
    fork_array =  Octokit.forks(name)
    fork_num = fork_array.length
    
    # get last commit activity
    commit_array_history = Octokit.commits(name)
    last_commit_array = commit_array_history[0]
    last_commit_commit = last_commit_array[:commit]
    last_commit_committer = last_commit_commit[:committer]
    last_commit_date = last_commit_committer[:date]
        
    # get number of contributors
    contri_stat = Octokit.contributors(name)
    contri_num = contri_stat.length
    puts contri_num
        
    # get commit counts for each users
    
    
    ind_contributors = Octokit.contributors(name)
    $len = ind_contributors.length
    $i = 0
    contri_list = Array.new
    while $i < $len do
        contri_name = ind_contributors[$i][:login]
        contri_commits = ind_contributors[$i][:contributions]
        $i += 1
        
        contri_hash = Hash.new
        contri_hash["label"] = contri_name
        contri_hash["value"] = contri_commits
        
        contri_list.push(contri_hash)
    end
        
#    puts contri_list
       
    # send github data
    send_event(name, {
        commits: commit_num,
        repo: name,
        forks: fork_num,
        watchers: r.subscribers_count,
        activity: last_commit_date,
        total_contributors: contri_num,
        items: contri_list
    })
    end
end
