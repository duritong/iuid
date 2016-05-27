require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Iuid" do

  context 'with config' do
    before(:each) do
      expect_any_instance_of(Iuid).to receive(:read_config).and_return(test_config)
    end
    let!(:iuid) do
      Iuid.new
    end

    describe "get" do
      it "should return nil as default" do
        expect(iuid.get('get_test')).to be_nil
      end
    end

    describe "create" do
      it "should create a new uid if not yet present" do
        expect(iuid.get('create_test')).to be_nil
        expect(iuid.create('create_test','global')).to eql(100)
        expect(iuid.get('create_test')).to eql(100)
      end

      it "should increase the next uid by one" do
        expect(iuid.get('create_test2')).to be_nil

        expect(iuid.create('create_test2','global')).to eql(100)
        expect(iuid.get('create_test2')).to eql(100)

        expect(iuid.create('create_test3','global')).to eql(101)
        expect(iuid.get('create_test3')).to eql(101)
      end

      it "should raise an exception if the next category is reached" do
        expect(iuid.create('create_test4','global2')).to eql(200)
        expect{ iuid.create('create_test5','global2') }.to raise_error(Exception)
      end

      it "should not create an existing uid" do
        expect(iuid.set('double_test1',100)).to eql(100)
        expect(iuid.create('double_test2','global')).to eql(101)
      end

      it "should not create an uid > 4294967295" do
        expect(iuid.create('max_test1','max')).to eql(4294967295)
        expect { iuid.create('max_test2','max') }.to raise_error(Exception)
      end
    end

    describe "set" do
      it "should set an uid and return it" do
        expect(iuid.get('set_test1')).to be_nil
        expect(iuid.set('set_test1',100)).to eql(100)
        expect(iuid.get('set_test1')).not_to be_nil
        expect(iuid.get('set_test1')).to be(100)
      end
    end

    describe "delete" do
      it "should delete a given uid" do
        expect(iuid.create('delete_test1','global')).not_to be_nil
        expect(iuid.get('delete_test1')).not_to be_nil
        expect(iuid.delete('delete_test1')).not_to be_nil
        expect(iuid.get('delete_test1')).to be_nil
      end
    end
  end

  describe "VERSION" do
    it "should return a version" do
      expect(Iuid::VERSION::STRING).not_to be_empty
    end
  end
end
