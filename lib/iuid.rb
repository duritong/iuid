require 'iuid/version'

class Iuid
  
  def initialize(config_file=nil)
    if config_file
      @config_file = File.expand_path(config_file)
    elsif File.exists?(def_config_file=File.expand_path('~/.iuid.yaml')) || File.exists?(def_config_file=File.expand_path('/etc/iuid.yaml')) 
      @config_file = def_config_file
    end
  end

  def create(name,category)
    unless (uid=get(name)).nil?
      return uid
    end

    set(name,next_uid(category))
  end
  
  def get(name)
    cache.fetch(name)
  end
  
  def delete(name)
    cache.delete(name)
  end
  
  def set(name,uid)
    cache[name] = uid
    cache['_all_uids'] = (alluids | [ uid ])
    uid
  end

  protected

  def next_uid(category)
    raise "Category #{category} is not configured!" unless max_uid=categories[category]
    if (curr_uid = cache["_category_#{category}_curr_uid"]) || max_uid && alluids.include?(curr_uid=max_uid)
      uid=curr_uid + 1
      while alluids.include?(uid) 
        uid = curr_uid + 1
      end
      raise "Max uid is 4294967295" if uid > 4294967295
      if coll_category = categories.keys.find{|c| categories[c] > max_uid && uid >= categories[c] }
        raise "Next available uid (uid) collides with category #{coll_category}"
      end
    else
      uid = max_uid
    end
    cache["_category_#{category}_curr_uid"] = uid
    uid
  end
  
  private
  def cache
    @cache ||= build_cache
  end

  def alluids
    cache.fetch('_all_uids',[])
  end

  def categories
    config['categories'] || {}
  end
  
  def build_cache
    require 'moneta'
    require "moneta/adapters/#{config['adapter'].downcase}"
    lconfig = config
    Moneta.new(lconfig['adapter'], lconfig['adapter_options']||{})
  end
  
  def config
    @config ||= read_config
  end
  
  def read_config
    if @config_file.nil?
      default_config
    else
      raise "Configfile #{@config_file} does not exist!" unless File.exists?(@config_file)
      default_config.merge(YAML.load(File.read(@config_file)))
    end
  end
  
  def default_config
      require 'yaml'
      YAML.load(File.read(File.expand_path(File.join(File.dirname(__FILE__),'iuid','default_config.yaml'))))
  end
  
end
