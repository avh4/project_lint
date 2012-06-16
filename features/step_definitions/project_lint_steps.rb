Given /^a java project using jbehave$/ do
  in_project_folder do
      File.open('pom.xml', 'w') {|f| f.write(<<-EOF) }
          <dependency>
            <groupId>org.jbehave</groupId>
            <artifactId>jbehave-core</artifactId>
            <scope>test</scope>
          </dependency>
      EOF
  end
end

Given /^a java project using cucumber\-jvm$/ do
  in_project_folder do
      File.open('pom.xml', 'w') {|f| f.write(<<-EOF) }
          <dependency>
            <groupId>info.cukes</groupId>
            <artifactId>cucumber-junit</artifactId>
            <version>${cucumber.version}</version>
            <scope>test</scope>
          </dependency>
      EOF
  end
end

When /^I run project_lint$/ do
  in_project_folder do
    @stdout_text = `#{@bin_path}/project_lint`
  end
end

Then /^I will be told "(.*?)"$/ do |message|
  actual_output = @stdout_text
  actual_output.should contain(message)
end

Then /^I will not see any messages about (.*?)$/ do |subject|
  actual_output = @stdout_text
  actual_output.should_not contain(subject)
end

