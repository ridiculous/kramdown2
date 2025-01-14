# -*- coding: utf-8; frozen_string_literal: true -*-
#
#--
# Copyright (C) 2009-2019 Thomas Leitner <t_leitner@gmx.at>
#
# This file is part of kramdown2 which is licensed under the MIT.
#++
#

module Kramdown2

  # == \Utils Module
  #
  # This module contains utility class/modules/methods that can be used by both parsers and
  # converters.
  module Utils

    autoload :Entities, 'kramdown2/utils/entities'
    autoload :Html, 'kramdown2/utils/html'
    autoload :Unidecoder, 'kramdown2/utils/unidecoder'
    autoload :StringScanner, 'kramdown2/utils/string_scanner'
    autoload :Configurable, 'kramdown2/utils/configurable'
    autoload :LRUCache, 'kramdown2/utils/lru_cache'

    # Treat +name+ as if it were snake cased (e.g. snake_case) and camelize it (e.g. SnakeCase).
    def self.camelize(name)
      name.split('_').inject(+'') {|s, x| s << x[0..0].upcase << x[1..-1] }
    end

    # Treat +name+ as if it were camelized (e.g. CamelizedName) and snake-case it (e.g. camelized_name).
    def self.snake_case(name)
      name = name.dup
      name.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      name.gsub!(/([a-z])([A-Z])/, '\1_\2')
      name.downcase!
      name
    end

    def self.deep_const_get(str)
      ::Object.const_get(str)
    end

  end

end
