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

#Output of asking for a single job in MochaTesting.
{
         "_class" => "hudson.tasks.junit.TestResult",
    "testActions" => [],
       "duration" => 0.012,
          "empty" => false,
      "failCount" => 0,
      "passCount" => 3,
      "skipCount" => 0,
         "suites" => [
        [0] {
                "cases" => [
                [0] {
                        "testActions" => [],
                                "age" => 0,
                          "className" => "Testing Board Functions Testing Create Board",
                           "duration" => 0.004,
                       "errorDetails" => nil,
                    "errorStackTrace" => nil,
                        "failedSince" => 0,
                               "name" => "should give back a board filled with all zeros",
                            "skipped" => false,
                     "skippedMessage" => nil,
                             "status" => "PASSED",
                             "stderr" => nil,
                             "stdout" => nil
                },
                [1] {
                        "testActions" => [],
                                "age" => 0,
                          "className" => "Testing Board Functions Testing Player Switching",
                           "duration" => 0.0,
                       "errorDetails" => nil,
                    "errorStackTrace" => nil,
                        "failedSince" => 0,
                               "name" => "Should change to o when it is currently x",
                            "skipped" => false,
                     "skippedMessage" => nil,
                             "status" => "PASSED",
                             "stderr" => nil,
                             "stdout" => nil
                },
                [2] {
                        "testActions" => [],
                                "age" => 0,
                          "className" => "Testing Board Functions Testing Player Switching",
                           "duration" => 0.0,
                       "errorDetails" => nil,
                    "errorStackTrace" => nil,
                        "failedSince" => 0,
                               "name" => "Should change to x when it is currently o",
                            "skipped" => false,
                     "skippedMessage" => nil,
                             "status" => "PASSED",
                             "stderr" => nil,
                             "stdout" => nil
                }
            ],
             "duration" => 0.012,
                   "id" => nil,
                 "name" => "Mocha Tests",
               "stderr" => nil,
               "stdout" => nil,
            "timestamp" => "2016-09-01T16:48:13"
        }
    ]
}

{
    "MochaTesting" => "success"
}
I, [2016-09-02T13:32:42.941177 #6020]  INFO -- : Obtaining the test results of 'MochaTesting' Build #5
{"_class"=>"hudson.tasks.junit.TestResult", "testActions"=>[], "duration"=>0.012, "empty"=>false, "failCount"=>0, "passCount"=>3, "skipCount"=>0, "suites"=>[{"cases"=>[{"testActions"=>[], "age"=>0, "className"=>"Testing Board Functions Testing Create Board", "duration"=>0.004, "errorDetails"=>nil, "errorStackTrace"=>nil, "failedSince"=>0, "name"=>"should give back a board filled with all zeros", "skipped"=>false, "skippedMessage"=>nil, "status"=>"PASSED", "stderr"=>nil, "stdout"=>nil}, {"testActions"=>[], "age"=>0, "className"=>"Testing Board Functions Testing Player Switching", "duration"=>0.0, "errorDetails"=>nil, "errorStackTrace"=>nil, "failedSince"=>0, "name"=>"Should change to o when it is currently x", "skipped"=>false, "skippedMessage"=>nil, "status"=>"PASSED", "stderr"=>nil, "stdout"=>nil}, {"testActions"=>[], "age"=>0, "className"=>"Testing Board Functions Testing Player Switching", "duration"=>0.0, "errorDetails"=>nil, "errorStackTrace"=>nil, "failedSince"=>0, "name"=>"Should change to x when it is currently o", "skipped"=>false, "skippedMessage"=>nil, "status"=>"PASSED", "stderr"=>nil, "stdout"=>nil}], "duration"=>0.012, "id"=>nil, "name"=>"Mocha Tests", "stderr"=>nil, "stdout"=>nil, "timestamp"=>"2016-09-01T16:48:13"}]}
