class PuppetProfiler
  def self.run(num_res, cmd)
    cmd = cmd + " --verbose --evaltrace --color=false"
    output = `#{cmd}`.split("\n")

    times = []
    output.each { |line|
      if line =~ /info: .*([A-Z][^\[]+)\[(.+?)\]: Evaluated in ([\d\.]+) seconds$/i
        type = $1
        title = $2
        time = $3.to_f
        times << [type, title, time]
      end
    }

    puts "Top #{num_res} Puppet resources by runtime"
    puts "=================================="
    puts ""
    times.sort { |a, b| a[2] <=> b[2] }.reverse[0..num_res].each { |item|
      puts "#{format('%4s', item[2])}s - #{item[0]}[#{item[1]}]"
    }
  end
end
