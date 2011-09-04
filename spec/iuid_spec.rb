require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Iuid" do
  
  before(:each) do
    Iuid.any_instance.expects(:read_config).returns(test_config)
    @iuid = Iuid.new
  end

  describe "get" do
    it "should return nil as default" do
      @iuid.get('get_test').should be_nil
    end
  end
  
  describe "create" do
    it "should create a new uid if not yet present" do
      @iuid.get('create_test').should be_nil
      @iuid.create('create_test','global').should eql(100)
      @iuid.get('create_test').should eql(100)
    end

    it "should increase the next uid by one" do
      @iuid.get('create_test2').should be_nil

      @iuid.create('create_test2','global').should eql(100)
      @iuid.get('create_test2').should eql(100)

      @iuid.create('create_test3','global').should eql(101)
      @iuid.get('create_test3').should eql(101)
    end

    it "should raise an exception if the next category is reached" do
      @iuid.create('create_test4','global2').should eql(200)
      lambda { @iuid.create('create_test5','global2') }.should raise_error(Exception)
    end

    it "should not create an existing uid" do
      @iuid.set('double_test1',100).should eql(100)
      @iuid.create('double_test2','global').should eql(101)
    end

    it "should not create an uid > 4294967295" do
      @iuid.create('max_test1','max').should eql(4294967295)
      lambda { @iuid.create('max_test2','max') }.should raise_error(Exception)
    end
  end
  
  describe "set" do
    it "should set an uid and return it" do
      @iuid.get('set_test1').should be_nil
      @iuid.set('set_test1',100).should eql(100)
      @iuid.get('set_test1').should_not be_nil
      @iuid.get('set_test1').should be(100)
    end
  end
  
  describe "delete" do
    it "should delete a given uid" do
      @iuid.create('delete_test1','global').should_not be_nil
      @iuid.get('delete_test1').should_not be_nil
      @iuid.delete('delete_test1').should_not be_nil
      @iuid.get('delete_test1').should be_nil
    end
  end
  
  describe "VERSION" do
    it "should return a version" do
      Iuid::VERSION::STRING.should_not be_empty
    end
  end
end
