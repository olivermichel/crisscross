Gem::Specification.new do |g|
  g.name          = 'crisscross'
  g.version       = '0.0.1'
  g.date          = '2015-05-25'
  g.summary       = 'Crisscross'
  g.description   = 'A simple Ruby graph library'
  g.authors       = ['Oliver Michel']
  g.email         = 'oliver.michel@editum.de'
  g.require_paths = ['lib']
  g.files         =
    [
      'lib/crisscross/graph.rb',
      'lib/crisscross/vertex.rb',
      'lib/crisscross/edge.rb',
      'lib/crisscross/attributes.rb',
      'lib/crisscross/generators/generator.rb',
      'lib/crisscross/generators/erdos_renyi_generator.rb',
      'lib/crisscross/generators/erdos_renyi_generator.rb'
    ]
  g.test_files    =
    [
      'spec/attributes_spec.rb',
      'spec/edge_spec.rb',
      'spec/graph_spec.rb',
      'spec/vertex_spec.rb',
      'spec/spec_helper.rb',
      'spec/erdos_renyi_generator_spec.rb',
      'spec/erdos_renyi_generator_spec.rb'
    ]
  g.homepage      = 'http://ngn.cg.colorado.edu/~oliver'
  g.license       = 'MIT'
end
