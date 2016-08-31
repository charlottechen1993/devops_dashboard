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
    puts "Commit Number: #{commit_num}"
    
    # get number of forks per repo
    fork_array =  Octokit.forks(name)
    fork_num = fork_array.length
    puts "Commit Number: #{fork_num}"
    
    # get last commit activity
#    commit_history = r.github_status_message
    commit_array_history = Octokit.commits(name)
    last_commit_array = commit_array_history[0]
    last_commit_commit = last_commit_array[:commit]
    last_commit_committer = last_commit_commit[:committer]
    last_commit_date = last_commit_committer[:date]
        puts "Commit Array: #{last_commit_array }"
        puts "Commit Commit: #{last_commit_commit }"
        puts "Commit Committer: #{ last_commit_committer }"
        puts "Commit Date: #{last_commit_date }"
        
        
    send_event(name, {
      commits: commit_num,
      repo: name,
      issues: r.open_issues_count - pulls,
      pulls: pulls,
      forks: fork_num,
      watchers: r.subscribers_count,
      activity: last_commit_date
    })
  end
end
