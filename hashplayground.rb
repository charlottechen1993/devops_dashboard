#Robert: I'm using this file to format outputted ruby hash tables from jenkins

#This is the output of jenkins_api.rb job. Hash of arrays of build data
{"MochaTesting"=>[
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>8, "url"=>"http://54.172.252.112:8080/job/MochaTesting/8/"},
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>7, "url"=>"http://54.172.252.112:8080/job/MochaTesting/7/"},
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>6, "url"=>"http://54.172.252.112:8080/job/MochaTesting/6/"},
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>5, "url"=>"http://54.172.252.112:8080/job/MochaTesting/5/"},
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>4, "url"=>"http://54.172.252.112:8080/job/MochaTesting/4/"},
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>3, "url"=>"http://54.172.252.112:8080/job/MochaTesting/3/"},
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>2, "url"=>"http://54.172.252.112:8080/job/MochaTesting/2/"},
      {"_class"=>"hudson.model.FreeStyleBuild", "number"=>1, "url"=>"http://54.172.252.112:8080/job/MochaTesting/1/"}],
  "SamplePipeline"=>
      [{"_class"=>"org.jenkinsci.plugins.workflow.job.WorkflowRun", "number"=>1, "url"=>"http://54.172.252.112:8080/job/SamplePipeline/1/"}]}

#This is the output of list_all_with_details. An [array] of hashes, one per job.
{"_class"=>"hudson.model.FreeStyleProject", "name"=>"MochaTesting", "url"=>"http://54.172.252.112:8080/job/MochaTesting/", "color"=>"blue"}
{"_class"=>"org.jenkinsci.plugins.workflow.job.WorkflowJob", "name"=>"SamplePipeline", "url"=>"http://54.172.252.112:8080/job/SamplePipeline/", "color"=>"red"}

#Output of get_current_build_status
{"MochaTesting"=>"success", "SamplePipeline"=>"failure"}
