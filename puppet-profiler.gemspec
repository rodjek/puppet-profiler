Gem::Specification.new do |s|
  s.name = 'puppet-profiler'
  s.version = '0.0.3'
  s.homepage = 'https://github.com/rodjek/puppet-profiler/'
  s.summary = 'Find the slow resources in your Puppet manifests'
  s.description = 'Analyses your Puppet runs on a host and returns a list of
  resources that are slowing down your Puppet runs.'

  s.executables = ['puppet-profiler']
  s.files = [
    'bin/puppet-profiler',
    'LICENSE',
    'lib/puppet-profiler.rb',
    'puppet-profiler.gemspec',
    'README.md',
  ]

  s.authors = ['Tim Sharpe']
  s.email = 'tim@sharpe.id.au'
end
