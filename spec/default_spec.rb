require "chefspec"

describe "motd-tail::default" do
  before do
    @file = "/etc/motd.tail"
    @chef_run = ChefSpec::ChefRunner.new.converge "motd-tail::default"
  end

  it "has proper owner" do
    @chef_run.template(@file).should be_owned_by("root", "root")
  end

  it "has proper modes" do
    m = @chef_run.template(@file).mode

    sprintf("%o", m).should == "644"
  end

  it "has chef client" do
    @chef_run.should create_file_with_content @file,
      "Chef-Client - chefspec.local"
  end

  it "has hostname" do
    @chef_run.should create_file_with_content @file,
      "Hostname: chefspec.local"
  end

  it "has chef server" do
    pending
    #Chef Server: <%= Chef::Config[:chef_server_url] %>
  end

  it "doesn't have environment" do
    @chef_run.should_not create_file_with_content @file,
      "Environment: chefspec.local"
  end

  it "has environment" do
    chef_run = ChefSpec::ChefRunner.new
    node = chef_run.converge("motd-tail::default").node
    node.stub(:chef_environment).and_return "env"

    chef_run.should create_file_with_content @file,
      "Environment: env"
  end

  # regexp once added https://github.com/acrmp/chefspec/pull/56
  it "has last run" do
    @chef_run.should create_file_with_content @file,
      "Last Run: 201"
  end

  it "has roles" do
    chef_run = ChefSpec::ChefRunner.new
    node = chef_run.converge("motd-tail::default").node
    node.roles << "role1"
    node.roles << "role2"

    chef_run.should create_file_with_content @file,
      "role1"
    chef_run.should create_file_with_content @file,
      "role2"
  end

  it "has tags" do
    chef_run = ChefSpec::ChefRunner.new
    node = chef_run.converge("motd-tail::default").node
    node.tags << "tag1"
    node.tags << "tag2"
    chef_run.should create_file_with_content @file,
      "Tags:"
    chef_run.should create_file_with_content @file,
      "tag1"
    chef_run.should create_file_with_content @file,
      "tag2"
  end
end
