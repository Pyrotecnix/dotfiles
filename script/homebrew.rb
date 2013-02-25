class Homebrew
  def initialize(brews)
    @brews = brews
  end

  def update
    puts "Updating Homebrew..."
    `brew update`
    puts "Upgrading the following apps: #{`brew outdated`}"
    `brew upgrade`
  end

  def install_all
    @brews.each do |brew|
      if brew.class == String
        install brew
      else
        name = brew.keys.first
        options = brew[name]
        install name, options
      end
    end
  end

  private

  def install(name, options = [])
    print "Installing #{name}... "
    status = `brew install #{name} #{options.join}`

    raise "No formula for #{name}" if status.include? "No available formula"

    if status.include? "already installed"
      puts "Already Installed!"
    else
      puts "Installed!"
    end
  end
end
