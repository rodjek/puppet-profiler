class PuppetProfiler
  def self.run(num_res)
    output = `puppet agent --test --evaltrace --color=false`.split("\n")

    times = []
    resources = output.select { |line| 
      line =~ /.+: E?valuated in [\d\.]+ seconds$/
    }.each { |line|
      res_line, junk, eval_line = line.rpartition(':')
      if eval_line =~ / E?valuated in ([\d\.]+) seconds$/
        time = $1.to_f
      end
      junk, junk, res_line = res_line.partition(':')
      if res_line =~ /.*([A-Z][^\[]+)\[(.+?)\]$/
        type = $1
        title = $2
      end
      times << [type, title, time]
    }

    puts "Top #{num_res} Puppet resources by runtime"
    puts "=================================="
    puts ""
    times.sort { |a, b| a[2] <=> b[2] }.reverse[0..num_res].each { |item|
      puts "#{format('%4s', item[2])}s - #{item[0]}[#{item[1]}]"
    }
  end
end
