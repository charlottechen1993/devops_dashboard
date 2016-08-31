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
    contri_stat = Octokit.contributors_stats(name)
    contri_num = contri_stat[0][:total]
        
    # get commit counts for each users
    contri_hash = Hash.new
    ind_contributors = Octokit.contributors(name)
    $len = ind_contributors.length
    $i = 0
    while $i < $len do
        contri_name = ind_contributors[$i][:login]
        contri_commits = ind_contributors[$i][:contributions]
#        puts "Participation: #{contri_name} => #{contri_commits}"
        $i += 1

        contri_hash[$i] = {:contri_name => contri_commits}
    end
    
    puts contri_hash
        
    # send contributor commit hashmap
    send_event(name, {
        contri_hash: contri_hash
    })
       
    # send github data
    send_event(name, {
        commits: commit_num,
        repo: name,
        forks: fork_num,
        watchers: r.subscribers_count,
        activity: last_commit_date,
        total_contributors: contri_num
    })
    end
end
