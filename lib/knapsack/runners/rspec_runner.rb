module Knapsack
  module Runners
    class RSpecRunner
      def self.run(args)
        allocator = Knapsack::AllocatorBuilder.new(Knapsack::Adapters::RSpecAdapter).allocator

        puts
        puts 'Report specs:'
        puts allocator.report_node_tests
        puts
        puts 'Leftover specs:'
        puts allocator.leftover_node_tests
        puts

        cmd = %Q[bundle exec rspec -r turnip/rspec -r turnip/capybara #{args}  #{allocator.stringify_node_tests}]

        system(cmd)
        exit($?.exitstatus) unless $?.exitstatus.zero?
      end
    end
  end
end
