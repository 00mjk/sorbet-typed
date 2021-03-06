# typed: strong

module GraphQL
  class << self
    sig { params(graphql_string: String, tracer: T.untyped).returns(GraphQL::Language::Nodes::Document) }
    def parse(graphql_string, tracer: T.unsafe(nil)); end

    def parse_file(filename); end
    def parse_with_racc(string, filename: T.unsafe(nil), tracer: T.unsafe(nil)); end
    def scan(graphql_string); end
    def scan_with_ragel(graphql_string); end
  end
end

module GraphQL::Analysis
  private

  def analysis_errors(results); end
  def analyze_multiplex(multiplex, analyzers); end
  def analyze_query(query, analyzers, multiplex_states: T.unsafe(nil)); end
  def reduce_node(irep_node, reducer_states); end
  def visit_analyzers(visit_type, irep_node, reducer_states); end

  class << self
    def analysis_errors(results); end
    def analyze_multiplex(multiplex, analyzers); end
    def analyze_query(query, analyzers, multiplex_states: T.unsafe(nil)); end
    def reduce_node(irep_node, reducer_states); end
    def visit_analyzers(visit_type, irep_node, reducer_states); end
  end
end

module GraphQL::Analysis::AST
  private

  def analysis_errors(results); end
  def analyze_multiplex(multiplex, analyzers); end
  def analyze_query(query, analyzers, multiplex_analyzers: T.unsafe(nil)); end
  def use(schema_class); end

  class << self
    def analysis_errors(results); end
    def analyze_multiplex(multiplex, analyzers); end
    def analyze_query(query, analyzers, multiplex_analyzers: T.unsafe(nil)); end
    def use(schema_class); end
  end
end

class GraphQL::Analysis::AST::Analyzer
  def initialize(subject); end

  def analyze?; end
  def on_enter_abstract_node(node, parent, visitor); end
  def on_enter_argument(node, parent, visitor); end
  def on_enter_directive(node, parent, visitor); end
  def on_enter_document(node, parent, visitor); end
  def on_enter_enum(node, parent, visitor); end
  def on_enter_field(node, parent, visitor); end
  def on_enter_fragment_spread(node, parent, visitor); end
  def on_enter_inline_fragment(node, parent, visitor); end
  def on_enter_input_object(node, parent, visitor); end
  def on_enter_list_type(node, parent, visitor); end
  def on_enter_non_null_type(node, parent, visitor); end
  def on_enter_null_value(node, parent, visitor); end
  def on_enter_operation_definition(node, parent, visitor); end
  def on_enter_type_name(node, parent, visitor); end
  def on_enter_variable_definition(node, parent, visitor); end
  def on_enter_variable_identifier(node, parent, visitor); end
  def on_leave_abstract_node(node, parent, visitor); end
  def on_leave_argument(node, parent, visitor); end
  def on_leave_directive(node, parent, visitor); end
  def on_leave_document(node, parent, visitor); end
  def on_leave_enum(node, parent, visitor); end
  def on_leave_field(node, parent, visitor); end
  def on_leave_fragment_spread(node, parent, visitor); end
  def on_leave_inline_fragment(node, parent, visitor); end
  def on_leave_input_object(node, parent, visitor); end
  def on_leave_list_type(node, parent, visitor); end
  def on_leave_non_null_type(node, parent, visitor); end
  def on_leave_null_value(node, parent, visitor); end
  def on_leave_operation_definition(node, parent, visitor); end
  def on_leave_type_name(node, parent, visitor); end
  def on_leave_variable_definition(node, parent, visitor); end
  def on_leave_variable_identifier(node, parent, visitor); end
  def result; end

  protected

  def multiplex; end
  def query; end
  def subject; end

  class << self

    private

    def build_visitor_hooks(member_name); end
  end
end

class GraphQL::Analysis::AST::FieldUsage < ::GraphQL::Analysis::AST::Analyzer
  def initialize(query); end

  def on_leave_field(node, parent, visitor); end
  def result; end
end

class GraphQL::Analysis::AST::MaxQueryComplexity < ::GraphQL::Analysis::AST::QueryComplexity
  def result; end
end

class GraphQL::Analysis::AST::MaxQueryDepth < ::GraphQL::Analysis::AST::QueryDepth
  def result; end
end

class GraphQL::Analysis::AST::QueryComplexity < ::GraphQL::Analysis::AST::Analyzer
  def initialize(query); end

  def on_enter_field(node, parent, visitor); end
  def on_leave_field(node, parent, visitor); end
  def result; end

  private

  def applies_to?(query, left_scope, right_scope); end
  def field_complexity(scoped_type_complexity, max_complexity:, child_complexity: T.unsafe(nil)); end
  def max_possible_complexity; end
  def merged_max_complexity(query, children_for_scope); end
  def merged_max_complexity_for_scopes(query, scoped_children_hashes); end
end

class GraphQL::Analysis::AST::QueryComplexity::ScopedTypeComplexity
  def initialize(node, field_definition, query, response_path); end

  def field_definition; end
  def own_complexity(child_complexity); end
  def query; end
  def response_path; end
  def scoped_children; end
  def terminal?; end
end

GraphQL::Analysis::AST::QueryComplexity::ScopedTypeComplexity::HASH_CHILDREN = T.let(T.unsafe(nil), Proc)

class GraphQL::Analysis::AST::QueryDepth < ::GraphQL::Analysis::AST::Analyzer
  def initialize(query); end

  def on_enter_field(node, parent, visitor); end
  def on_leave_field(node, parent, visitor); end
  def result; end
end

class GraphQL::Analysis::AST::Visitor < ::GraphQL::Language::Visitor
  def initialize(query:, analyzers:); end

  def argument_definition; end
  def arguments_for(ast_node, field_definition); end
  def directive_definition; end
  def field_definition; end
  def object_types; end
  def on_abstract_node(node, parent); end
  def on_argument(node, parent); end
  def on_directive(node, parent); end
  def on_field(node, parent); end
  def on_fragment_definition(node, parent); end
  def on_fragment_spread(node, parent); end
  def on_inline_fragment(node, parent); end
  def on_operation_definition(node, parent); end
  def parent_type_definition; end
  def previous_argument_definition; end
  def previous_field_definition; end
  def query; end
  def response_path; end
  def skipping?; end
  def type_definition; end
  def visit; end
  def visiting_fragment_definition?; end

  private

  def call_analyzers(method, node, parent); end
  def enter_fragment_spread_inline(fragment_spread); end
  def leave_fragment_spread_inline(_fragment_spread); end
  def on_fragment_with_type(node); end
  def skip?(ast_node); end
end

class GraphQL::Analysis::FieldUsage
  def initialize(&block); end

  def call(memo, visit_type, irep_node); end
  def final_value(memo); end
  def initial_value(query); end
end

class GraphQL::Analysis::MaxQueryComplexity < ::GraphQL::Analysis::QueryComplexity
  def initialize(max_complexity); end
end

class GraphQL::Analysis::MaxQueryDepth < ::GraphQL::Analysis::QueryDepth
  def initialize(max_depth); end
end

class GraphQL::Analysis::QueryComplexity
  def initialize(&block); end

  def call(memo, visit_type, irep_node); end
  def final_value(reduced_value); end
  def initial_value(target); end

  private

  def get_complexity(irep_node, child_complexity); end
end

class GraphQL::Analysis::QueryComplexity::TypeComplexity
  def initialize; end

  def max_possible_complexity; end
  def merge(type_defn, complexity); end
end

class GraphQL::Analysis::QueryDepth
  def initialize(&block); end

  def call(memo, visit_type, irep_node); end
  def final_value(memo); end
  def initial_value(query); end
end

class GraphQL::Analysis::ReducerState
  def initialize(reducer, query); end

  def call(visit_type, irep_node); end
  def errors; end
  def errors=(_); end
  def finalize_reducer; end
  def memo; end
  def memo=(_); end
  def reducer; end

  private

  def initialize_reducer(reducer, query); end
end

class GraphQL::AnalysisError < ::GraphQL::ExecutionError
end

class GraphQL::Argument
  include(::GraphQL::Define::InstanceDefinable)
  extend(::GraphQL::Define::InstanceDefinable::ClassMethods)

  def initialize; end

  def as; end
  def as=(_); end
  def ast_node; end
  def ast_node=(_); end
  def default_value; end
  def default_value=(new_default_value); end
  def default_value?; end
  def description; end
  def description=(_); end
  def expose_as; end
  def graphql_name; end
  def keyword; end
  def method_access; end
  def method_access=(_); end
  def method_access?; end
  def name; end
  def name=(_); end
  def prepare(value, ctx); end
  def prepare=(prepare_proc); end
  def type; end
  def type=(new_input_type); end
  def type_class; end

  private

  def initialize_copy(other); end

  class << self
    def deep_stringify(val); end
    def from_dsl(name, type_or_argument = T.unsafe(nil), description = T.unsafe(nil), default_value: T.unsafe(nil), as: T.unsafe(nil), prepare: T.unsafe(nil), **kwargs, &block); end
  end
end

module GraphQL::Argument::DefaultPrepare
  class << self
    def call(value, ctx); end
  end
end

GraphQL::Argument::NO_DEFAULT_VALUE = T.let(T.unsafe(nil), Object)

module GraphQL::Authorization
end

module GraphQL::Authorization::Analyzer
  private

  def call(memo, visit_type, irep_node); end
  def final_value(memo); end
  def initial_value(query); end

  class << self
    def call(memo, visit_type, irep_node); end
    def final_value(memo); end
    def initial_value(query); end
  end
end

class GraphQL::Authorization::InaccessibleFieldsError < ::GraphQL::AnalysisError
  def initialize(fields:, irep_nodes:, context:); end

  def context; end
  def fields; end
  def irep_nodes; end
end

GraphQL::BOOLEAN_TYPE = T.let(T.unsafe(nil), GraphQL::ScalarType)

class GraphQL::Backtrace
  include(::Enumerable)
  extend(::Forwardable)
  Elem = type_member(fixed: T.untyped)

  def initialize(context, value: T.unsafe(nil)); end

  def [](*args, &block); end
  def each(*args, &block); end
  def inspect; end
  def to_a; end
  def to_s; end

  class << self
    def disable; end
    def enable; end
    def use(schema_defn); end
  end
end

module GraphQL::Backtrace::InspectResult
  private

  def inspect_result(obj); end
  def inspect_truncated(obj); end

  class << self
    def inspect_result(obj); end
    def inspect_truncated(obj); end
  end
end

class GraphQL::Backtrace::Table
  def initialize(context, value:); end

  def to_backtrace; end
  def to_table; end

  private

  def build_rows(context_entry, rows:, top: T.unsafe(nil)); end
  def render_table(rows); end
  def rows; end
end

GraphQL::Backtrace::Table::HEADERS = T.let(T.unsafe(nil), T::Array[T.untyped])

GraphQL::Backtrace::Table::MAX_COL_WIDTH = T.let(T.unsafe(nil), Integer)

GraphQL::Backtrace::Table::MIN_COL_WIDTH = T.let(T.unsafe(nil), Integer)

class GraphQL::Backtrace::TracedError < ::GraphQL::Error
  def initialize(err, current_ctx); end

  def context; end
  def graphql_backtrace; end
end

GraphQL::Backtrace::TracedError::CAUSE_BACKTRACE_PREVIEW_LENGTH = T.let(T.unsafe(nil), Integer)

GraphQL::Backtrace::TracedError::MESSAGE_TEMPLATE = T.let(T.unsafe(nil), String)

module GraphQL::Backtrace::Tracer
  private

  def trace(key, metadata); end

  class << self
    def trace(key, metadata); end
  end
end

module GraphQL::BackwardsCompatibility
  private

  def get_arity(callable); end
  def wrap_arity(callable, from:, to:, name:, last: T.unsafe(nil)); end

  class << self
    def get_arity(callable); end
    def wrap_arity(callable, from:, to:, name:, last: T.unsafe(nil)); end
  end
end

class GraphQL::BackwardsCompatibility::FirstArgumentsWrapper
  def initialize(callable, old_arity); end

  def call(*args); end
end

class GraphQL::BackwardsCompatibility::LastArgumentsWrapper < ::GraphQL::BackwardsCompatibility::FirstArgumentsWrapper
  def call(*args); end
end

class GraphQL::BaseType
  include(::GraphQL::Define::NonNullWithBang)
  include(::GraphQL::Define::InstanceDefinable)
  include(::GraphQL::Relay::TypeExtensions)
  extend(::GraphQL::Define::InstanceDefinable::ClassMethods)

  def initialize; end

  def ==(other); end
  def ast_node; end
  def ast_node=(_); end
  def coerce_input(value, ctx = T.unsafe(nil)); end
  def coerce_isolated_input(value); end
  def coerce_isolated_result(value); end
  def coerce_result(value, ctx); end
  def default_relay=(_); end
  def default_relay?; end
  def default_scalar=(_); end
  def default_scalar?; end
  def description; end
  def description=(_); end
  def get_field(name); end
  def graphql_definition; end
  def graphql_name; end
  def inspect; end
  def introspection=(_); end
  def introspection?; end
  def list?; end
  def name; end
  def name=(name); end
  def non_null?; end
  def resolve_type(value, ctx); end
  def to_definition(schema, printer: T.unsafe(nil), **args); end
  def to_list_type; end
  def to_non_null_type; end
  def to_s; end
  def to_type_signature; end
  def type_class; end
  def unwrap; end
  def valid_input?(value, ctx = T.unsafe(nil)); end
  def valid_isolated_input?(value); end
  def validate_input(value, ctx = T.unsafe(nil)); end
  def validate_isolated_input(value); end

  private

  def initialize_copy(other); end
  def warn_deprecated_coerce(alt_method_name); end

  class << self
    def resolve_related_type(type_arg); end
  end
end

module GraphQL::BaseType::ModifiesAnotherType
  def ==(other); end
  def unwrap; end
end

class GraphQL::CoercionError < ::GraphQL::Error
  def initialize(message, extensions: T.unsafe(nil)); end

  def extensions; end
  def extensions=(_); end
end

module GraphQL::Compatibility
end

module GraphQL::Compatibility::ExecutionSpecification
  class << self
    def build_suite(execution_strategy); end
  end
end

module GraphQL::Compatibility::ExecutionSpecification::CounterSchema
  class << self
    def build(execution_strategy); end
  end
end

module GraphQL::Compatibility::ExecutionSpecification::SpecificationSchema
  class << self
    def build(execution_strategy); end
  end
end

GraphQL::Compatibility::ExecutionSpecification::SpecificationSchema::BOGUS_NODE = T.let(T.unsafe(nil), OpenStruct)

class GraphQL::Compatibility::ExecutionSpecification::SpecificationSchema::CustomCollection
  def initialize(storage); end

  def each(&block); end
end

GraphQL::Compatibility::ExecutionSpecification::SpecificationSchema::DATA = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

module GraphQL::Compatibility::ExecutionSpecification::SpecificationSchema::TestMiddleware
  class << self
    def call(parent_type, parent_object, field_definition, field_args, query_context, &next_middleware); end
  end
end

module GraphQL::Compatibility::LazyExecutionSpecification
  class << self
    def build_suite(execution_strategy); end
  end
end

module GraphQL::Compatibility::LazyExecutionSpecification::LazySchema
  class << self
    def build(execution_strategy); end
  end
end

module GraphQL::Compatibility::LazyExecutionSpecification::LazySchema::LazyInstrumentation
  class << self
    def instrument(type, field); end
  end
end

class GraphQL::Compatibility::LazyExecutionSpecification::LazySchema::LazyPush
  def initialize(ctx, value); end

  def push; end
  def value; end
end

class GraphQL::Compatibility::LazyExecutionSpecification::LazySchema::LazyPushCollection
  def initialize(ctx, values); end

  def push; end
  def value; end
end

module GraphQL::Compatibility::QueryParserSpecification
  class << self
    def build_suite(&block); end
  end
end

module GraphQL::Compatibility::QueryParserSpecification::ParseErrorSpecification
  def assert_raises_parse_error(query_string); end
  def assert_rejects_character(char); end
  def test_it_includes_line_and_column; end
  def test_it_rejects_bad_unicode; end
  def test_it_rejects_blank_queries; end
  def test_it_rejects_empty_inline_fragments; end
  def test_it_rejects_invalid_characters; end
  def test_it_rejects_unexpected_ends; end
  def test_it_rejects_unterminated_strings; end
  def test_it_restricts_on; end
end

GraphQL::Compatibility::QueryParserSpecification::QUERY_STRING = T.let(T.unsafe(nil), String)

module GraphQL::Compatibility::QueryParserSpecification::QueryAssertions
  def assert_valid_directive(directive); end
  def assert_valid_field(field); end
  def assert_valid_fragment(fragment_def); end
  def assert_valid_fragment_spread(fragment_spread); end
  def assert_valid_literal_argument(argument); end
  def assert_valid_query(query); end
  def assert_valid_typed_inline_fragment(inline_fragment); end
  def assert_valid_typeless_inline_fragment(inline_fragment); end
  def assert_valid_variable(variable); end
  def assert_valid_variable_argument(argument); end
end

module GraphQL::Compatibility::SchemaParserSpecification
  class << self
    def build_suite(&block); end
  end
end

GraphQL::Compatibility::SchemaParserSpecification::SCHEMA_DEFINITION_STRING = T.let(T.unsafe(nil), String)

module GraphQL::Define
  class << self
    def assign_metadata_key(key); end
  end
end

module GraphQL::Define::AssignArgument
  class << self
    def call(target, *args, **kwargs, &block); end
  end
end

module GraphQL::Define::AssignConnection
  class << self
    def call(type_defn, *field_args, max_page_size: T.unsafe(nil), **field_kwargs, &field_block); end
  end
end

module GraphQL::Define::AssignEnumValue
  class << self
    def call(enum_type, name, desc = T.unsafe(nil), deprecation_reason: T.unsafe(nil), value: T.unsafe(nil), &block); end
  end
end

module GraphQL::Define::AssignGlobalIdField
  class << self
    def call(type_defn, field_name); end
  end
end

module GraphQL::Define::AssignMutationFunction
  class << self
    def call(target, function); end
  end
end

class GraphQL::Define::AssignMutationFunction::ResultProxy < ::SimpleDelegator
  def initialize(target, client_mutation_id); end

  def client_mutation_id; end
end

module GraphQL::Define::AssignObjectField
  class << self
    def call(owner_type, name, type_or_field = T.unsafe(nil), desc = T.unsafe(nil), function: T.unsafe(nil), field: T.unsafe(nil), relay_mutation_function: T.unsafe(nil), **kwargs, &block); end
  end
end

class GraphQL::Define::DefinedObjectProxy
  extend(::GraphQL::Ruby2Keywords)

  def initialize(target); end

  def method_missing(name, *args, &block); end
  def target; end
  def types; end
  def use(plugin, **kwargs); end

  private

  def respond_to_missing?(name, include_private = T.unsafe(nil)); end
end

module GraphQL::Define::InstanceDefinable
  mixes_in_class_methods(::GraphQL::Define::InstanceDefinable::ClassMethods)

  def define(**kwargs, &block); end
  def metadata; end
  def redefine(**kwargs, &block); end

  private

  def ensure_defined; end
  def initialize_copy(other); end
  def revive_dependent_methods; end
  def stash_dependent_methods; end

  class << self
    def included(base); end
  end
end

class GraphQL::Define::InstanceDefinable::AssignAttribute
  extend(::GraphQL::Ruby2Keywords)

  def initialize(attr_name); end

  def call(defn, *value); end
end

class GraphQL::Define::InstanceDefinable::AssignMetadataKey
  def initialize(key); end

  def call(defn, value = T.unsafe(nil)); end
end

module GraphQL::Define::InstanceDefinable::ClassMethods
  def accepts_definitions(*accepts); end
  def define(**kwargs, &block); end
  def dictionary; end
  def ensure_defined(*method_names); end
  def ensure_defined_method_names; end
  def own_dictionary; end
end

class GraphQL::Define::InstanceDefinable::Definition
  def initialize(define_keywords, define_proc); end

  def define_keywords; end
  def define_proc; end
end

class GraphQL::Define::NoDefinitionError < ::GraphQL::Error
end

module GraphQL::Define::NonNullWithBang
  def !; end
end

class GraphQL::Define::TypeDefiner
  include(::Singleton)
  extend(::Singleton::SingletonClassMethods)

  def Boolean; end
  def Float; end
  def ID; end
  def Int; end
  def String; end
  def [](type); end
end

module GraphQL::DeprecatedDSL
  class << self
    def activate; end
  end
end

module GraphQL::DeprecatedDSL::Methods
  def !; end
end

GraphQL::DeprecatedDSL::TYPE_CLASSES = T.let(T.unsafe(nil), T::Array[T.untyped])

module GraphQL::Dig
  def dig(own_key, *rest_keys); end
end

class GraphQL::Directive
  include(::GraphQL::Define::InstanceDefinable)
  extend(::GraphQL::Define::InstanceDefinable::ClassMethods)

  def initialize; end

  def arguments; end
  def arguments=(_); end
  def arguments_class; end
  def arguments_class=(_); end
  def ast_node; end
  def ast_node=(_); end
  def default_directive=(_); end
  def default_directive?; end
  def description; end
  def description=(_); end
  def get_argument(argument_name); end
  def graphql_definition; end
  def graphql_name; end
  def inspect; end
  def locations; end
  def locations=(_); end
  def name; end
  def name=(_); end
  def on_field?; end
  def on_fragment?; end
  def on_operation?; end
  def to_s; end
  def type_class; end
end

GraphQL::Directive::ARGUMENT_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::DeprecatedDirective = T.let(T.unsafe(nil), GraphQL::Directive)

GraphQL::Directive::ENUM = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::ENUM_VALUE = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::FIELD = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::FIELD_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::FRAGMENT_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::FRAGMENT_SPREAD = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::INLINE_FRAGMENT = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::INPUT_FIELD_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::INPUT_OBJECT = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::INTERFACE = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::IncludeDirective = T.let(T.unsafe(nil), GraphQL::Directive)

GraphQL::Directive::LOCATIONS = T.let(T.unsafe(nil), T::Array[T.untyped])

GraphQL::Directive::LOCATION_DESCRIPTIONS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

GraphQL::Directive::MUTATION = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::OBJECT = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::QUERY = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::SCALAR = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::SCHEMA = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::SUBSCRIPTION = T.let(T.unsafe(nil), Symbol)

GraphQL::Directive::SkipDirective = T.let(T.unsafe(nil), GraphQL::Directive)

GraphQL::Directive::UNION = T.let(T.unsafe(nil), Symbol)

class GraphQL::EnumType < ::GraphQL::BaseType
  def initialize; end

  def add_value(enum_value); end
  def ast_node; end
  def ast_node=(_); end
  def coerce_result(value, ctx = T.unsafe(nil)); end
  def kind; end
  def to_s; end
  def values; end
  def values=(new_values); end

  private

  def coerce_non_null_input(value_name, ctx); end
  def initialize_copy(other); end
  def validate_non_null_input(value_name, ctx); end
end

class GraphQL::EnumType::EnumValue
  include(::GraphQL::Define::InstanceDefinable)
  extend(::GraphQL::Define::InstanceDefinable::ClassMethods)

  def ast_node; end
  def ast_node=(_); end
  def deprecation_reason; end
  def deprecation_reason=(_); end
  def description; end
  def description=(_); end
  def graphql_name; end
  def name; end
  def name=(new_name); end
  def type_class; end
  def value; end
  def value=(_); end
end

GraphQL::EnumType::EnumValue::ATTRIBUTES = T.let(T.unsafe(nil), T::Array[T.untyped])

class GraphQL::EnumType::UnresolvedValueError < ::GraphQL::Error
end

class GraphQL::Error < ::StandardError
end

module GraphQL::Execution
end

module GraphQL::Execution::DirectiveChecks
  private

  def include?(directive_ast_nodes, query); end

  class << self
    def include?(directive_ast_nodes, query); end
  end
end

GraphQL::Execution::DirectiveChecks::INCLUDE = T.let(T.unsafe(nil), String)

GraphQL::Execution::DirectiveChecks::SKIP = T.let(T.unsafe(nil), String)

class GraphQL::Execution::Errors
  def initialize(schema); end

  def with_error_handling(ctx); end

  class << self
    def use(schema); end
  end
end

class GraphQL::Execution::Errors::NullErrorHandler
  class << self
    def with_error_handling(_ctx); end
  end
end

class GraphQL::Execution::Execute
  include(::GraphQL::Execution::Execute::ExecutionFunctions)

  def execute(ast_operation, root_type, query); end

  class << self
    def begin_multiplex(_multiplex); end
    def begin_query(query, _multiplex); end
    def finish_multiplex(results, multiplex); end
    def finish_query(query, _multiplex); end
  end
end

module GraphQL::Execution::Execute::ExecutionFunctions
  private

  def continue_or_wait(raw_value, field_type, field_ctx); end
  def continue_resolve_field(raw_value, field_type, field_ctx); end
  def lazy_resolve_root_selection(result, query: T.unsafe(nil), multiplex: T.unsafe(nil)); end
  def resolve_field(object, field_ctx); end
  def resolve_root_selection(query); end
  def resolve_selection(object, current_type, current_ctx, mutation: T.unsafe(nil)); end
  def resolve_value(value, field_type, field_ctx); end

  class << self
    def continue_or_wait(raw_value, field_type, field_ctx); end
    def continue_resolve_field(raw_value, field_type, field_ctx); end
    def lazy_resolve_root_selection(result, query: T.unsafe(nil), multiplex: T.unsafe(nil)); end
    def resolve_field(object, field_ctx); end
    def resolve_root_selection(query); end
    def resolve_selection(object, current_type, current_ctx, mutation: T.unsafe(nil)); end
    def resolve_value(value, field_type, field_ctx); end
  end
end

module GraphQL::Execution::Execute::FieldResolveStep
  class << self
    def call(_parent_type, parent_object, field_definition, field_args, context, _next = T.unsafe(nil)); end
  end
end

GraphQL::Execution::Execute::PROPAGATE_NULL = T.let(T.unsafe(nil), GraphQL::Execution::Execute::PropagateNull)

class GraphQL::Execution::Execute::PropagateNull
end

GraphQL::Execution::Execute::SKIP = T.let(T.unsafe(nil), GraphQL::Execution::Execute::Skip)

class GraphQL::Execution::Execute::Skip
end

module GraphQL::Execution::Flatten
  class << self
    def call(ctx); end

    private

    def flatten(obj); end
  end
end

module GraphQL::Execution::Instrumentation
  class << self
    def apply_instrumenters(multiplex); end

    private

    def call_after_hooks(instrumenters, object, after_hook_name, ex); end
    def call_hooks(instrumenters, object, before_hook_name, after_hook_name); end
    def each_query_call_hooks(instrumenters, queries, i = T.unsafe(nil)); end
  end
end

class GraphQL::Execution::Interpreter
  def initialize; end

  def evaluate(query); end
  def execute(_operation, _root_type, query); end
  def sync_lazies(query: T.unsafe(nil), multiplex: T.unsafe(nil)); end

  class << self
    def begin_multiplex(multiplex); end
    def begin_query(query, multiplex); end
    def finish_multiplex(_results, multiplex); end
    def finish_query(query, _multiplex); end
    def use(schema_class); end
  end
end

class GraphQL::Execution::Interpreter::ArgumentValue
  def initialize(definition:, value:, default_used:); end

  def default_used?; end
  def definition; end
  def value; end
end

class GraphQL::Execution::Interpreter::Arguments
  include(::GraphQL::Dig)
  extend(::Forwardable)

  def initialize(keyword_arguments:, argument_values:); end

  def [](*args, &block); end
  def argument_values; end
  def each(*args, &block); end
  def each_value(*args, &block); end
  def inspect; end
  def key?(*args, &block); end
  def keys(*args, &block); end
  def keyword_arguments; end
  def values(*args, &block); end
end

class GraphQL::Execution::Interpreter::ArgumentsCache
  def initialize(query); end

  def fetch(ast_node, argument_owner, parent_object); end

  private

  def prepare_args_hash(ast_arg_or_hash_or_value); end
end

GraphQL::Execution::Interpreter::ArgumentsCache::NO_VALUE_GIVEN = T.let(T.unsafe(nil), Object)

class GraphQL::Execution::Interpreter::ExecutionErrors
  def initialize(ctx, ast_node, path); end

  def add(err_or_msg); end
end

module GraphQL::Execution::Interpreter::HandlesRawValue
  def raw_value(obj); end
end

class GraphQL::Execution::Interpreter::HashResponse
  def initialize; end

  def final_value; end
  def inspect; end
  def write(path, value); end
end

class GraphQL::Execution::Interpreter::ListResultFailedError < ::GraphQL::Error
  def initialize(value:, path:, field:); end
end

class GraphQL::Execution::Interpreter::RawValue
  def initialize(obj = T.unsafe(nil)); end

  def resolve; end
end

module GraphQL::Execution::Interpreter::Resolve
  class << self
    def resolve(results); end
    def resolve_all(results); end
  end
end

class GraphQL::Execution::Interpreter::Runtime
  def initialize(query:, response:); end

  def add_dead_path(path); end
  def after_lazy(lazy_obj, owner:, field:, path:, scoped_context:, owner_object:, arguments:, eager: T.unsafe(nil), trace: T.unsafe(nil), &block); end
  def arguments(graphql_object, arg_owner, ast_node); end
  def authorized_new(type, value, context, path); end
  def context; end
  def continue_field(path, value, field, type, ast_node, next_selections, is_non_null, owner_object, arguments); end
  def continue_value(path, value, field, is_non_null, ast_node); end
  def dead_path?(path); end
  def directives_include?(node, graphql_object, parent_type); end
  def evaluate_selections(path, scoped_context, owner_object, owner_type, selections, root_operation_type: T.unsafe(nil)); end
  def final_value; end
  def gather_selections(owner_object, owner_type, selections, selections_by_name); end
  def inspect; end
  def query; end
  def resolve_type(type, value, path); end
  def resolve_with_directives(object, ast_node, &block); end
  def run_directive(object, ast_node, idx, &block); end
  def run_eager; end
  def schema; end
  def set_type_at_path(path, type); end
  def type_at(path); end
  def write_execution_errors_in_response(path, errors); end
  def write_in_response(path, value); end
  def write_invalid_null_in_response(path, invalid_null_error); end
end

GraphQL::Execution::Interpreter::Runtime::HALT = T.let(T.unsafe(nil), Object)

class GraphQL::Execution::Lazy
  def initialize(path: T.unsafe(nil), field: T.unsafe(nil), &get_value_func); end

  def field; end
  def path; end
  def then; end
  def value; end

  class << self
    def all(lazies); end
    def resolve(val); end
  end
end

class GraphQL::Execution::Lazy::LazyMethodMap
  def initialize(use_concurrent: T.unsafe(nil)); end

  def each; end
  def get(value); end
  def set(lazy_class, lazy_value_method); end

  protected

  def storage; end

  private

  def find_superclass_method(value_class); end
  def initialize_copy(other); end
end

class GraphQL::Execution::Lazy::LazyMethodMap::ConcurrentishMap
  extend(::Forwardable)

  def initialize; end

  def []=(key, value); end
  def compute_if_absent(key); end
  def each_pair(*args, &block); end
  def size(*args, &block); end

  protected

  def copy_storage; end

  private

  def initialize_copy(other); end
end

GraphQL::Execution::Lazy::NullResult = T.let(T.unsafe(nil), GraphQL::Execution::Lazy)

module GraphQL::Execution::Lazy::Resolve
  class << self
    def deep_sync(val); end
    def each_lazy(acc, value); end
    def resolve(value); end
    def resolve_in_place(value); end
  end
end

module GraphQL::Execution::Lazy::Resolve::NullAccumulator
  class << self
    def <<(item); end
    def empty?; end
  end
end

class GraphQL::Execution::Lookahead
  def initialize(query:, ast_nodes:, field: T.unsafe(nil), root_type: T.unsafe(nil), owner_type: T.unsafe(nil)); end

  def arguments; end
  def ast_nodes; end
  def field; end
  def inspect; end
  def name; end
  def owner_type; end
  def selected?; end
  def selection(field_name, selected_type: T.unsafe(nil), arguments: T.unsafe(nil)); end
  def selections(arguments: T.unsafe(nil)); end
  def selects?(field_name, arguments: T.unsafe(nil)); end

  private

  def arguments_match?(arguments, field_defn, field_node); end
  def find_selected_nodes(node, field_name, field_defn, arguments:, matches:); end
  def find_selections(subselections_by_type, selections_on_type, selected_type, ast_selections, arguments); end
  def get_class_based_field(type, name); end
  def normalize_keyword(keyword); end
  def normalize_name(name); end
  def skipped_by_directive?(ast_selection); end
end

GraphQL::Execution::Lookahead::NULL_LOOKAHEAD = T.let(T.unsafe(nil), GraphQL::Execution::Lookahead::NullLookahead)

class GraphQL::Execution::Lookahead::NullLookahead < ::GraphQL::Execution::Lookahead
  def initialize; end

  def inspect; end
  def selected?; end
  def selection(*_); end
  def selections(*_); end
  def selects?(*_); end
end

class GraphQL::Execution::Multiplex
  include(::GraphQL::Tracing::Traceable)

  def initialize(schema:, queries:, context:, max_complexity:); end

  def context; end
  def max_complexity; end
  def queries; end
  def schema; end

  class << self
    def run_all(schema, query_options, **kwargs); end
    def run_queries(schema, queries, context: T.unsafe(nil), max_complexity: T.unsafe(nil)); end

    private

    def begin_query(query, multiplex); end
    def finish_query(data_result, query, multiplex); end
    def instrument_and_analyze(multiplex); end
    def run_as_multiplex(multiplex); end
    def run_one_legacy(schema, query); end
    def supports_multiplexing?(schema); end
  end
end

GraphQL::Execution::Multiplex::NO_OPERATION = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

module GraphQL::Execution::Typecast
  class << self
    def subtype?(parent_type, child_type); end
  end
end

class GraphQL::ExecutionError < ::GraphQL::Error
  def initialize(message, ast_node: T.unsafe(nil), options: T.unsafe(nil), extensions: T.unsafe(nil)); end

  def ast_node; end
  def ast_node=(_); end
  def extensions; end
  def extensions=(_); end
  def options; end
  def options=(_); end
  def path; end
  def path=(_); end
  def to_h; end
end

GraphQL::FLOAT_TYPE = T.let(T.unsafe(nil), GraphQL::ScalarType)

class GraphQL::Field
  include(::GraphQL::Define::InstanceDefinable)
  extend(::GraphQL::Define::InstanceDefinable::ClassMethods)

  def initialize; end

  def arguments; end
  def arguments=(_); end
  def arguments_class; end
  def arguments_class=(_); end
  def ast_node; end
  def ast_node=(_); end
  def complexity; end
  def complexity=(_); end
  def connection=(_); end
  def connection?; end
  def connection_max_page_size; end
  def connection_max_page_size=(_); end
  def deprecation_reason; end
  def deprecation_reason=(_); end
  def description; end
  def description=(_); end
  def edge_class; end
  def edge_class=(_); end
  def edges?; end
  def function; end
  def function=(_); end
  def get_argument(argument_name); end
  def graphql_definition; end
  def graphql_name; end
  def hash_key; end
  def hash_key=(new_hash_key); end
  def introspection=(_); end
  def introspection?; end
  def lazy_resolve(obj, args, ctx); end
  def lazy_resolve=(new_lazy_resolve_proc); end
  def lazy_resolve_proc; end
  def mutation; end
  def mutation=(_); end
  def name; end
  def name=(new_name); end
  def prepare_lazy(obj, args, ctx); end
  def property; end
  def property=(new_property); end
  def relay_node_field; end
  def relay_node_field=(_); end
  def relay_nodes_field; end
  def relay_nodes_field=(_); end
  def resolve(object, arguments, context); end
  def resolve=(new_resolve_proc); end
  def resolve_proc; end
  def subscription_scope; end
  def subscription_scope=(_); end
  def to_s; end
  def trace; end
  def trace=(_); end
  def type; end
  def type=(new_return_type); end
  def type_class; end

  private

  def build_default_resolver; end
  def initialize_copy(other); end
end

module GraphQL::Field::DefaultLazyResolve
  class << self
    def call(obj, args, ctx); end
  end
end

module GraphQL::Field::Resolve
  private

  def create_proc(field); end

  class << self
    def create_proc(field); end
  end
end

class GraphQL::Field::Resolve::BuiltInResolve
end

class GraphQL::Field::Resolve::HashKeyResolve < ::GraphQL::Field::Resolve::BuiltInResolve
  def initialize(hash_key); end

  def call(obj, args, ctx); end
end

class GraphQL::Field::Resolve::MethodResolve < ::GraphQL::Field::Resolve::BuiltInResolve
  def initialize(field); end

  def call(obj, args, ctx); end
end

class GraphQL::Field::Resolve::NameResolve < ::GraphQL::Field::Resolve::BuiltInResolve
  def initialize(field); end

  def call(obj, args, ctx); end
end

class GraphQL::Filter
  def initialize(only: T.unsafe(nil), except: T.unsafe(nil)); end

  def call(member, ctx); end
  def merge(only: T.unsafe(nil), except: T.unsafe(nil)); end
end

class GraphQL::Filter::MergedExcept < ::GraphQL::Filter::MergedOnly
  def call(member, ctx); end
end

class GraphQL::Filter::MergedOnly
  def initialize(first, second); end

  def call(member, ctx); end

  class << self
    def build(onlies); end
  end
end

class GraphQL::Function
  def arguments; end
  def call(obj, args, ctx); end
  def complexity; end
  def deprecation_reason; end
  def description; end
  def type; end

  class << self
    def argument(*args, **kwargs, &block); end
    def arguments; end
    def build_field(function); end
    def complexity(new_value = T.unsafe(nil)); end
    def deprecation_reason(new_value = T.unsafe(nil)); end
    def description(new_value = T.unsafe(nil)); end
    def type(premade_type = T.unsafe(nil), &block); end
    def types; end

    private

    def own_arguments; end
    def parent_function?; end
  end
end

GraphQL::ID_TYPE = T.let(T.unsafe(nil), GraphQL::ScalarType)

GraphQL::INT_TYPE = T.let(T.unsafe(nil), GraphQL::ScalarType)

class GraphQL::InputObjectType < ::GraphQL::BaseType
  def initialize; end

  def arguments; end
  def arguments=(_); end
  def arguments_class; end
  def arguments_class=(_); end
  def coerce_result(value, ctx = T.unsafe(nil)); end
  def get_argument(argument_name); end
  def input_fields; end
  def kind; end
  def mutation; end
  def mutation=(_); end

  private

  def coerce_non_null_input(value, ctx); end
  def initialize_copy(other); end
  def validate_non_null_input(input, ctx); end
end

GraphQL::InputObjectType::INVALID_OBJECT_MESSAGE = T.let(T.unsafe(nil), String)

class GraphQL::IntegerEncodingError < ::GraphQL::RuntimeTypeError
  def initialize(value); end

  def integer_value; end
end

class GraphQL::InterfaceType < ::GraphQL::BaseType
  def initialize; end

  def all_fields; end
  def fields; end
  def fields=(_); end
  def get_field(field_name); end
  def get_possible_type(type_name, ctx); end
  def kind; end
  def orphan_types; end
  def orphan_types=(_); end
  def possible_type?(type, ctx); end
  def resolve_type(value, ctx); end
  def resolve_type=(resolve_type_callable); end
  def resolve_type_proc; end
  def resolve_type_proc=(_); end
  def type_membership_class; end
  def type_membership_class=(_); end

  private

  def initialize_copy(other); end
end

module GraphQL::InternalRepresentation
end

class GraphQL::InternalRepresentation::Document
  def initialize; end

  def [](key); end
  def each(&block); end
  def fragment_definitions; end
  def operation_definitions; end
end

class GraphQL::InternalRepresentation::Node
  def initialize(name:, owner_type:, query:, return_type:, parent:, ast_nodes: T.unsafe(nil), definitions: T.unsafe(nil)); end

  def ==(other); end
  def arguments; end
  def ast_node; end
  def ast_nodes; end
  def deep_merge_node(new_parent, scope: T.unsafe(nil), merge_self: T.unsafe(nil)); end
  def definition; end
  def definition_name; end
  def definitions; end
  def inspect; end
  def name; end
  def owner_type; end
  def parent; end
  def query; end
  def return_type; end
  def scoped_children; end
  def subscription_topic; end
  def typed_children; end

  protected

  def owner_type=(_); end
  def parent=(_); end

  private

  def get_typed_children(obj_type); end
  def initialize_copy(other_node); end
end

GraphQL::InternalRepresentation::Node::DEFAULT_TYPED_CHILDREN = T.let(T.unsafe(nil), Proc)

GraphQL::InternalRepresentation::Node::NO_TYPED_CHILDREN = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

module GraphQL::InternalRepresentation::Print
  private

  def print(schema, query_string); end
  def print_node(node, indent: T.unsafe(nil)); end

  class << self
    def print(schema, query_string); end
    def print_node(node, indent: T.unsafe(nil)); end
  end
end

module GraphQL::InternalRepresentation::Rewrite
  include(::GraphQL::Language)

  def initialize(*_); end

  def on_field(ast_node, ast_parent); end
  def on_fragment_definition(ast_node, parent); end
  def on_fragment_spread(ast_node, ast_parent); end
  def on_inline_fragment(node, parent); end
  def on_operation_definition(ast_node, parent); end
  def operations; end
  def push_root_node(ast_node, definitions); end
  def rewrite_document; end
  def skip?(ast_node); end
end

GraphQL::InternalRepresentation::Rewrite::NO_DIRECTIVES = T.let(T.unsafe(nil), T::Array[T.untyped])

class GraphQL::InternalRepresentation::Scope
  def initialize(query, type_defn); end

  def each(&block); end
  def enter(other_type_defn); end

  private

  def concrete_types; end
end

GraphQL::InternalRepresentation::Scope::NO_TYPES = T.let(T.unsafe(nil), T::Array[T.untyped])

module GraphQL::InternalRepresentation::Visit
  private

  def each_node(node, &block); end
  def visit_each_node(operations, handlers); end

  class << self
    def each_node(node, &block); end
    def visit_each_node(operations, handlers); end
  end
end

module GraphQL::Introspection
end

class GraphQL::Introspection::BaseObject < ::GraphQL::Schema::Object
  class << self
    def field(*args, **kwargs, &block); end
  end
end

class GraphQL::Introspection::BaseObject::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Introspection::DirectiveLocationEnum < ::GraphQL::Schema::Enum
end

class GraphQL::Introspection::DirectiveLocationEnum::UnresolvedValueError < ::GraphQL::Schema::Enum::UnresolvedValueError
end

class GraphQL::Introspection::DirectiveType < ::GraphQL::Introspection::BaseObject
  def args; end
end

class GraphQL::Introspection::DirectiveType::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Introspection::DynamicFields < ::GraphQL::Introspection::BaseObject
  def __typename(irep_node: T.unsafe(nil)); end
end

class GraphQL::Introspection::DynamicFields::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Introspection::EntryPoints < ::GraphQL::Introspection::BaseObject
  def __schema; end
  def __type(name:); end
end

class GraphQL::Introspection::EntryPoints::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Introspection::EnumValueType < ::GraphQL::Introspection::BaseObject
  def is_deprecated; end
  def name; end
end

class GraphQL::Introspection::EnumValueType::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Introspection::FieldType < ::GraphQL::Introspection::BaseObject
  def args; end
  def is_deprecated; end
end

class GraphQL::Introspection::FieldType::InvalidNullError < ::GraphQL::InvalidNullError
end

GraphQL::Introspection::INTROSPECTION_QUERY = T.let(T.unsafe(nil), String)

class GraphQL::Introspection::InputValueType < ::GraphQL::Introspection::BaseObject
  def default_value; end

  private

  def serialize_default_value(value, type); end
end

class GraphQL::Introspection::InputValueType::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Introspection::SchemaType < ::GraphQL::Introspection::BaseObject
  def directives; end
  def mutation_type; end
  def query_type; end
  def subscription_type; end
  def types; end

  private

  def permitted_root_type(op_type); end
end

class GraphQL::Introspection::SchemaType::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Introspection::TypeKindEnum < ::GraphQL::Schema::Enum
end

class GraphQL::Introspection::TypeKindEnum::UnresolvedValueError < ::GraphQL::Schema::Enum::UnresolvedValueError
end

class GraphQL::Introspection::TypeType < ::GraphQL::Introspection::BaseObject
  def enum_values(include_deprecated:); end
  def fields(include_deprecated:); end
  def input_fields; end
  def interfaces; end
  def kind; end
  def name; end
  def of_type; end
  def possible_types; end
end

class GraphQL::Introspection::TypeType::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::InvalidNameError < ::GraphQL::ExecutionError
  def initialize(name, valid_regex); end

  def name; end
  def valid_regex; end
end

class GraphQL::InvalidNullError < ::GraphQL::RuntimeTypeError
  def initialize(parent_type, field, value); end

  def field; end
  def parent_error?; end
  def parent_type; end
  def to_h; end
  def value; end
end

module GraphQL::Language
  class << self
    def serialize(value); end
  end
end

module GraphQL::Language::BlockString
  class << self
    def break_line(line, length); end
    def print(str, indent: T.unsafe(nil)); end
    def trim_whitespace(str); end
  end
end

module GraphQL::Language::DefinitionSlice
  extend(::GraphQL::Language::DefinitionSlice)

  def slice(document, name); end
end

class GraphQL::Language::DefinitionSlice::DependencyVisitor < ::GraphQL::Language::Visitor
  def initialize(doc, definitions, names); end

  def on_fragment_spread(node, parent); end

  class << self
    def find_definition_dependencies(definitions, name, names); end
  end
end

class GraphQL::Language::Nodes::AbstractNode
  def initialize(options = T.unsafe(nil)); end

  def ==(other); end
  def children; end
  def children_method_name; end
  def col; end
  def delete_child(previous_child); end
  def filename; end
  def line; end
  def merge(new_options); end
  def position; end
  def replace_child(previous_child, new_child); end
  def scalars; end
  def to_query_string(printer: T.unsafe(nil)); end

  protected

  def merge!(new_options); end

  private

  def initialize_copy(other); end

  class << self
    def inherited(child_class); end

    private

    def children_methods(children_of_type); end
    def generate_initialize_node; end
    def scalar_methods(*method_names); end
  end
end

class GraphQL::Language::Nodes::Document < ::GraphQL::Language::Nodes::AbstractNode
  def children; end
  def definitions; end
  def initialize_node(definitions: T.unsafe(nil)); end
  def slice_definition(name); end
  def visit_method; end

  class << self
    def children_method_name; end
    def children_method_name=(_); end
  end
end

class GraphQL::Language::Printer
  def print(node, indent: T.unsafe(nil)); end

  protected

  def print_argument(argument); end
  def print_arguments(arguments, indent: T.unsafe(nil)); end
  def print_description(node, indent: T.unsafe(nil), first_in_block: T.unsafe(nil)); end
  def print_directive(directive); end
  def print_directive_definition(directive); end
  def print_directives(directives); end
  def print_document(document); end
  def print_enum(enum); end
  def print_enum_type_definition(enum_type); end
  def print_enum_value_definition(enum_value); end
  def print_field(field, indent: T.unsafe(nil)); end
  def print_field_definition(field); end
  def print_field_definitions(fields); end
  def print_fragment_definition(fragment_def, indent: T.unsafe(nil)); end
  def print_fragment_spread(fragment_spread, indent: T.unsafe(nil)); end
  def print_inline_fragment(inline_fragment, indent: T.unsafe(nil)); end
  def print_input_object(input_object); end
  def print_input_object_type_definition(input_object_type); end
  def print_input_value_definition(input_value); end
  def print_interface_type_definition(interface_type); end
  def print_list_type(list_type); end
  def print_node(node, indent: T.unsafe(nil)); end
  def print_non_null_type(non_null_type); end
  def print_null_value; end
  def print_object_type_definition(object_type); end
  def print_operation_definition(operation_definition, indent: T.unsafe(nil)); end
  def print_scalar_type_definition(scalar_type); end
  def print_schema_definition(schema); end
  def print_selections(selections, indent: T.unsafe(nil)); end
  def print_type_name(type_name); end
  def print_union_type_definition(union_type); end
  def print_variable_definition(variable_definition); end
  def print_variable_identifier(variable_identifier); end

  private

  def node; end
end

class GraphQL::Language::SanitizedPrinter < ::GraphQL::Language::Printer
  def initialize(query); end

  def print_argument(argument); end
  def print_directive(directive); end
  def print_field(field, indent: T.unsafe(nil)); end
  def print_fragment_definition(fragment_def, indent: T.unsafe(nil)); end
  def print_inline_fragment(inline_fragment, indent: T.unsafe(nil)); end
  def print_list_type(list_type); end
  def print_node(node, indent: T.unsafe(nil)); end
  def print_operation_definition(operation_definition, indent: T.unsafe(nil)); end
  def print_variable_identifier(variable_id); end
  def sanitized_query_string; end

  private

  def query; end
  def value_to_ast(value, type); end
end

GraphQL::Language::SanitizedPrinter::REDACTED = T.let(T.unsafe(nil), String)

class GraphQL::Language::Visitor
  def initialize(document); end

  def [](node_class); end
  def on_abstract_node(node, parent); end
  def on_argument(node, parent); end
  def on_directive(node, parent); end
  def on_directive_definition(node, parent); end
  def on_directive_location(node, parent); end
  def on_document(node, parent); end
  def on_enum(node, parent); end
  def on_enum_type_definition(node, parent); end
  def on_enum_type_extension(node, parent); end
  def on_enum_value_definition(node, parent); end
  def on_field(node, parent); end
  def on_field_definition(node, parent); end
  def on_fragment_definition(node, parent); end
  def on_fragment_spread(node, parent); end
  def on_inline_fragment(node, parent); end
  def on_input_object(node, parent); end
  def on_input_object_type_definition(node, parent); end
  def on_input_object_type_extension(node, parent); end
  def on_input_value_definition(node, parent); end
  def on_interface_type_definition(node, parent); end
  def on_interface_type_extension(node, parent); end
  def on_list_type(node, parent); end
  def on_non_null_type(node, parent); end
  def on_null_value(node, parent); end
  def on_object_type_definition(node, parent); end
  def on_object_type_extension(node, parent); end
  def on_operation_definition(node, parent); end
  def on_scalar_type_definition(node, parent); end
  def on_scalar_type_extension(node, parent); end
  def on_schema_definition(node, parent); end
  def on_schema_extension(node, parent); end
  def on_type_name(node, parent); end
  def on_union_type_definition(node, parent); end
  def on_union_type_extension(node, parent); end
  def on_variable_definition(node, parent); end
  def on_variable_identifier(node, parent); end
  def result; end
  def visit; end
  def visit_node(node, parent); end

  private

  def begin_visit(node, parent); end
  def end_visit(node, parent); end
  def on_node_with_modifications(node, parent); end

  class << self
    def apply_hooks(hooks, node, parent); end
    def make_visit_method(node_method); end
  end
end

GraphQL::Language::Visitor::DELETE_NODE = T.let(T.unsafe(nil), GraphQL::Language::Visitor::DeleteNode)

class GraphQL::Language::Visitor::DeleteNode
end

class GraphQL::Language::Visitor::NodeVisitor
  def initialize; end

  def <<(hook); end
  def enter; end
  def leave; end
end

GraphQL::Language::Visitor::SKIP = T.let(T.unsafe(nil), Symbol)

class GraphQL::ListType < ::GraphQL::BaseType
  include(::GraphQL::BaseType::ModifiesAnotherType)

  def initialize(of_type:); end

  def coerce_result(value, ctx = T.unsafe(nil)); end
  def inspect; end
  def kind; end
  def list?; end
  def of_type; end
  def to_s; end
  def to_type_signature; end

  private

  def coerce_non_null_input(value, ctx); end
  def ensure_array(value); end
  def validate_non_null_input(value, ctx); end
end

class GraphQL::LoadApplicationObjectFailedError < ::GraphQL::ExecutionError
  def initialize(argument:, id:, object:); end

  def argument; end
  def id; end
  def object; end
end

class GraphQL::NameValidator
  class << self
    def valid?(name); end
    def validate!(name); end
  end
end

GraphQL::NameValidator::VALID_NAME_REGEX = T.let(T.unsafe(nil), Regexp)

class GraphQL::NonNullType < ::GraphQL::BaseType
  include(::GraphQL::BaseType::ModifiesAnotherType)
  extend(::Forwardable)

  def initialize(of_type:); end

  def coerce_input(*args, &block); end
  def coerce_result(*args, &block); end
  def inspect; end
  def kind; end
  def list?(*args, &block); end
  def non_null?; end
  def of_type; end
  def to_s; end
  def to_type_signature; end
  def valid_input?(value, ctx); end
  def validate_input(value, ctx); end
end

class GraphQL::ObjectType < ::GraphQL::BaseType
  def initialize; end

  def all_fields; end
  def fields; end
  def fields=(_); end
  def get_field(field_name); end
  def implements(interfaces, inherit: T.unsafe(nil), **options); end
  def interfaces(ctx = T.unsafe(nil)); end
  def interfaces=(new_interfaces); end
  def kind; end
  def mutation; end
  def mutation=(_); end
  def relay_node_type; end
  def relay_node_type=(_); end
  def resolve_type_proc; end
  def structural_interface_type_memberships=(_); end

  protected

  def inherited_interface_type_memberships; end
  def structural_interface_type_memberships; end

  private

  def initialize_copy(other); end
  def interface_fields; end
  def normalize_interfaces(ifaces); end
end

module GraphQL::Pagination
end

class GraphQL::Pagination::ActiveRecordRelationConnection < ::GraphQL::Pagination::RelationConnection
  def null_relation(relation); end
  def relation_count(relation); end
  def relation_limit(relation); end
  def relation_offset(relation); end
end

class GraphQL::Pagination::ArrayConnection < ::GraphQL::Pagination::Connection
  def cursor_for(item); end
  def has_next_page; end
  def has_previous_page; end
  def nodes; end

  private

  def index_from_cursor(cursor); end
  def load_nodes; end
end

class GraphQL::Pagination::Connection
  def initialize(items, context: T.unsafe(nil), first: T.unsafe(nil), after: T.unsafe(nil), max_page_size: T.unsafe(nil), last: T.unsafe(nil), before: T.unsafe(nil)); end

  def after; end
  def after_value; end
  def after_value=(_); end
  def before; end
  def before_value; end
  def before_value=(_); end
  def context; end
  def context=(_); end
  def cursor_for(item); end
  def edge_nodes; end
  def edges; end
  def end_cursor; end
  def first; end
  def first=(_); end
  def first_value; end
  def first_value=(_); end
  def has_max_page_size_override?; end
  def has_next_page; end
  def has_previous_page; end
  def items; end
  def last; end
  def last=(_); end
  def last_value; end
  def last_value=(_); end
  def max_page_size; end
  def max_page_size=(new_value); end
  def nodes; end
  def page_info; end
  def start_cursor; end

  private

  def decode(cursor); end
  def encode(cursor); end
  def limit_pagination_argument(argument, max_page_size); end

  class << self
    def edge_class; end
  end
end

class GraphQL::Pagination::Connection::Edge
  def initialize(item, connection); end

  def cursor; end
  def node; end
end

class GraphQL::Pagination::Connection::PaginationImplementationMissingError < ::GraphQL::Error
end

class GraphQL::Pagination::Connections
  def initialize(schema:); end

  def add(nodes_class, implementation); end
  def all_wrappers; end
  def delete(nodes_class); end
  def wrap(field, object, arguments, context, wrappers: T.unsafe(nil)); end

  protected

  def wrappers; end

  private

  def add_default; end

  class << self
    def use(schema_defn); end
  end
end

class GraphQL::Pagination::Connections::ImplementationMissingError < ::GraphQL::Error
end

class GraphQL::Pagination::MongoidRelationConnection < ::GraphQL::Pagination::RelationConnection
  def null_relation(relation); end
  def relation_count(relation); end
  def relation_limit(relation); end
  def relation_offset(relation); end
end

class GraphQL::Pagination::RelationConnection < ::GraphQL::Pagination::Connection
  def cursor_for(item); end
  def has_next_page; end
  def has_previous_page; end
  def nodes; end

  private

  def after_offset; end
  def before_offset; end
  def limited_nodes; end
  def load_nodes; end
  def null_relation(relation); end
  def offset_from_cursor(cursor); end
  def relation_count(relation); end
  def relation_limit(relation); end
  def relation_offset(relation); end
  def set_limit(relation, limit_value); end
  def set_offset(relation, offset_value); end
  def sliced_nodes; end
end

class GraphQL::Pagination::SequelDatasetConnection < ::GraphQL::Pagination::RelationConnection

  private

  def null_relation(relation); end
  def relation_count(relation); end
  def relation_limit(relation); end
  def relation_offset(relation); end
end

class GraphQL::ParseError < ::GraphQL::Error
  def initialize(message, line, col, query, filename: T.unsafe(nil)); end

  def col; end
  def line; end
  def query; end
  def to_h; end
end

class GraphQL::Query
  include(::GraphQL::Tracing::Traceable)
  extend(::Forwardable)

  def initialize(schema, query_string = T.unsafe(nil), query: T.unsafe(nil), document: T.unsafe(nil), context: T.unsafe(nil), variables: T.unsafe(nil), validate: T.unsafe(nil), subscription_topic: T.unsafe(nil), operation_name: T.unsafe(nil), root_value: T.unsafe(nil), max_depth: T.unsafe(nil), max_complexity: T.unsafe(nil), except: T.unsafe(nil), only: T.unsafe(nil), warden: T.unsafe(nil)); end

  def analysis_errors; end
  def analysis_errors=(_); end
  def analyzers(*args, &block); end
  def arguments_for(ast_node, definition, parent_object: T.unsafe(nil)); end
  def ast_analyzers(*args, &block); end
  def context; end
  def document; end
  def executed?; end
  def fingerprint; end
  def fragments; end
  def get_field(*args, &block); end
  def get_type(*args, &block); end
  def inspect; end
  def internal_representation(*args, &block); end
  def interpreter?(*args, &block); end
  def irep_selection; end
  def lookahead; end
  def max_complexity(*args, &block); end
  def max_depth(*args, &block); end
  def merge_filters(only: T.unsafe(nil), except: T.unsafe(nil)); end
  def mutation?; end
  def operation_fingerprint; end
  def operation_name; end
  def operation_name=(_); end
  def operations; end
  def possible_types(*args, &block); end
  def provided_variables; end
  def query?; end
  def query_string; end
  def query_string=(_); end
  def resolve_type(abstract_type, value = T.unsafe(nil)); end
  def result; end
  def result_values; end
  def result_values=(result_hash); end
  def root_type_for_operation(*args, &block); end
  def root_value; end
  def root_value=(_); end
  def sanitized_query_string; end
  def schema; end
  def selected_operation; end
  def selected_operation_name; end
  def static_errors; end
  def subscription?; end
  def subscription_topic; end
  def subscription_update?; end
  def tracers; end
  def valid?; end
  def validate; end
  def validate=(_); end
  def validation_errors(*args, &block); end
  def validation_pipeline; end
  def variables; end
  def variables_fingerprint; end
  def warden; end
  def with_error_handling; end

  private

  def find_operation(operations, operation_name); end
  def prepare_ast; end
  def with_prepared_ast; end
end

class GraphQL::Query::Arguments
  include(::GraphQL::Dig)
  extend(::Forwardable)

  def initialize(values, context:, defaults_used:); end

  def [](key); end
  def any?(*args, &block); end
  def argument_values; end
  def default_used?(key); end
  def each(*args, &block); end
  def each_value; end
  def key?(key); end
  def keys(*args, &block); end
  def prepare; end
  def to_h; end
  def to_hash; end
  def to_kwargs; end
  def values(*args, &block); end

  private

  def unwrap_value(value); end
  def wrap_value(value, arg_defn_type, context); end

  class << self
    def argument_definitions; end
    def argument_definitions=(_); end
    def argument_owner; end
    def argument_owner=(_); end
    def construct_arguments_class(argument_owner); end
  end
end

class GraphQL::Query::Arguments::ArgumentValue
  def initialize(key, value, definition, default_used); end

  def default_used=(_); end
  def default_used?; end
  def definition; end
  def key; end
  def value; end
end

GraphQL::Query::Arguments::NO_ARGS = T.let(T.unsafe(nil), GraphQL::Query::Arguments::NoArguments)

GraphQL::Query::Arguments::NULL_ARGUMENT_VALUE = T.let(T.unsafe(nil), GraphQL::Query::Arguments::ArgumentValue)

class GraphQL::Query::Arguments::NoArguments < ::GraphQL::Query::Arguments
end

module GraphQL::Query::ArgumentsCache
  class << self
    def build(query); end
  end
end

class GraphQL::Query::Context
  include(::GraphQL::Query::Context::SharedMethods)
  extend(::Forwardable)

  def initialize(query:, values:, object:, schema: T.unsafe(nil)); end

  def [](key); end
  def []=(*args, &block); end
  def ast_node; end
  def dig(*args, &block); end
  def errors; end
  def execution_strategy; end
  def execution_strategy=(new_strategy); end
  def fetch(*args, &block); end
  def inspect; end
  def interpreter=(_); end
  def interpreter?(*args, &block); end
  def irep_node; end
  def key?(key); end
  def namespace(ns); end
  def path; end
  def query; end
  def received_null_child; end
  def schema; end
  def scoped_context; end
  def scoped_context=(_); end
  def scoped_merge!(hash); end
  def scoped_set!(key, value); end
  def strategy; end
  def to_h; end
  def to_hash; end
  def trace(*args, &block); end
  def value=(_); end
  def warden; end
end

class GraphQL::Query::Context::ExecutionErrors
  def initialize(ctx); end

  def >>(err_or_msg); end
  def add(err_or_msg); end
  def push(err_or_msg); end
end

class GraphQL::Query::Context::FieldResolutionContext
  include(::GraphQL::Query::Context::SharedMethods)
  include(::GraphQL::Tracing::Traceable)
  extend(::Forwardable)

  def initialize(context, key, irep_node, parent, object); end

  def [](*args, &block); end
  def []=(*args, &block); end
  def add_error(error); end
  def ast_node; end
  def dig(*args, &block); end
  def errors(*args, &block); end
  def execution_strategy(*args, &block); end
  def fetch(*args, &block); end
  def field; end
  def inspect; end
  def interpreter?(*args, &block); end
  def irep_node; end
  def key; end
  def key?(*args, &block); end
  def namespace(*args, &block); end
  def parent; end
  def parent_type; end
  def path; end
  def query; end
  def schema; end
  def selection; end
  def spawn(*args, &block); end
  def strategy(*args, &block); end
  def to_h(*args, &block); end
  def type; end
  def value=(new_value); end
  def warden(*args, &block); end
  def wrapped_connection; end
  def wrapped_connection=(_); end
  def wrapped_object; end
  def wrapped_object=(_); end

  protected

  def received_null_child; end

  private

  def list_of_non_null_items?(type); end
end

module GraphQL::Query::Context::SharedMethods
  def add_error(error); end
  def backtrace; end
  def delete(child_ctx); end
  def execution_errors; end
  def invalid_null?; end
  def lookahead; end
  def object; end
  def object=(_); end
  def skip; end
  def skipped; end
  def skipped=(_); end
  def skipped?; end
  def spawn_child(key:, irep_node:, object:); end
  def value; end
end

class GraphQL::Query::Executor
  def initialize(query); end

  def query; end
  def result; end

  private

  def execute; end
end

class GraphQL::Query::Executor::PropagateNull < ::StandardError
end

module GraphQL::Query::Fingerprint
  class << self
    def generate(input_str); end
  end
end

class GraphQL::Query::InputValidationResult
  def initialize(valid: T.unsafe(nil), problems: T.unsafe(nil)); end

  def add_problem(explanation, path = T.unsafe(nil), extensions: T.unsafe(nil), message: T.unsafe(nil)); end
  def merge_result!(path, inner_result); end
  def problems; end
  def problems=(_); end
  def valid?; end
end

class GraphQL::Query::LiteralInput
  class << self
    def coerce(type, ast_node, variables); end
    def from_arguments(ast_arguments, argument_owner, variables); end
  end
end

class GraphQL::Query::NullContext
  def initialize; end

  def [](key); end
  def interpreter?; end
  def query; end
  def schema; end
  def warden; end

  class << self
    def [](key); end
    def instance; end
    def interpreter?(*args, &block); end
    def query(*args, &block); end
    def schema(*args, &block); end
    def warden(*args, &block); end
  end
end

class GraphQL::Query::NullContext::NullWarden < ::GraphQL::Schema::Warden
  def visible?(t); end
  def visible_field?(t); end
  def visible_type?(t); end
end

class GraphQL::Query::OperationNameMissingError < ::GraphQL::ExecutionError
  def initialize(name); end
end

class GraphQL::Query::Result
  extend(::Forwardable)

  def initialize(query:, values:); end

  def ==(other); end
  def [](*args, &block); end
  def as_json(*args, &block); end
  def context(*args, &block); end
  def inspect; end
  def keys(*args, &block); end
  def method_missing(method_name, *args, &block); end
  def mutation?(*args, &block); end
  def query; end
  def query?(*args, &block); end
  def subscription?(*args, &block); end
  def to_h; end
  def to_json(*args, &block); end
  def values(*args, &block); end

  private

  def respond_to_missing?(method_name, include_private = T.unsafe(nil)); end
end

class GraphQL::Query::SerialExecution
  def execute(ast_operation, root_type, query_object); end
  def field_resolution; end
  def operation_resolution; end
  def selection_resolution; end
end

class GraphQL::Query::SerialExecution::FieldResolution
  def initialize(selection, parent_type, target, query_ctx); end

  def arguments; end
  def execution_context; end
  def field; end
  def irep_node; end
  def parent_type; end
  def query; end
  def result; end
  def target; end

  private

  def get_finished_value(raw_value); end
  def get_raw_value; end
end

module GraphQL::Query::SerialExecution::OperationResolution
  class << self
    def resolve(selection, target, query); end
  end
end

module GraphQL::Query::SerialExecution::SelectionResolution
  class << self
    def resolve(target, current_type, selection, query_ctx); end
  end
end

module GraphQL::Query::SerialExecution::ValueResolution
  class << self
    def resolve(parent_type, field_defn, field_type, value, selection, query_ctx); end
  end
end

class GraphQL::Query::ValidationPipeline
  def initialize(query:, validate:, parse_error:, operation_name_error:, max_depth:, max_complexity:); end

  def analyzers; end
  def internal_representation; end
  def max_complexity; end
  def max_depth; end
  def valid?; end
  def validation_errors; end

  private

  def build_analyzers(schema, max_depth, max_complexity); end
  def ensure_has_validated; end
end

class GraphQL::Query::VariableValidationError < ::GraphQL::ExecutionError
  def initialize(variable_ast, type, value, validation_result); end

  def to_h; end
  def validation_result; end
  def validation_result=(_); end
  def value; end
  def value=(_); end

  private

  def problem_fields; end
end

class GraphQL::Query::Variables
  extend(::Forwardable)

  def initialize(ctx, ast_variables, provided_variables); end

  def [](*args, &block); end
  def context; end
  def errors; end
  def fetch(*args, &block); end
  def key?(*args, &block); end
  def length(*args, &block); end
  def to_h(*args, &block); end
end

module GraphQL::Relay
end

class GraphQL::Relay::ArrayConnection < ::GraphQL::Relay::BaseConnection
  def cursor_from_node(item); end
  def has_next_page; end
  def has_previous_page; end

  private

  def first; end
  def index_from_cursor(cursor); end
  def last; end
  def paged_nodes; end
  def sliced_nodes; end
end

class GraphQL::Relay::BaseConnection
  def initialize(nodes, arguments, field: T.unsafe(nil), max_page_size: T.unsafe(nil), parent: T.unsafe(nil), context: T.unsafe(nil)); end

  def after; end
  def arguments; end
  def before; end
  def context; end
  def cursor_from_node(object); end
  def decode(data); end
  def edge_nodes; end
  def encode(data); end
  def end_cursor; end
  def field; end
  def first; end
  def has_next_page; end
  def has_previous_page; end
  def inspect; end
  def last; end
  def max_page_size; end
  def nodes; end
  def page_info; end
  def parent; end
  def start_cursor; end

  private

  def limit_pagination_argument(argument, max_page_size); end
  def paged_nodes; end
  def sliced_nodes; end

  class << self
    def connection_for_nodes(nodes); end
    def register_connection_implementation(nodes_class, connection_class); end
  end
end

GraphQL::Relay::BaseConnection::CONNECTION_IMPLEMENTATIONS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

GraphQL::Relay::BaseConnection::CURSOR_SEPARATOR = T.let(T.unsafe(nil), String)

module GraphQL::Relay::ConnectionInstrumentation
  class << self
    def default_arguments; end
    def instrument(type, field); end
  end
end

class GraphQL::Relay::ConnectionResolve
  def initialize(field, underlying_resolve); end

  def call(obj, args, ctx); end

  private

  def build_connection(nodes, args, parent, ctx); end
end

module GraphQL::Relay::ConnectionType
  class << self
    def bidirectional_pagination; end
    def bidirectional_pagination=(_); end
    def create_type(wrapped_type, edge_type: T.unsafe(nil), edge_class: T.unsafe(nil), nodes_field: T.unsafe(nil), &block); end
    def default_nodes_field; end
    def default_nodes_field=(_); end
  end
end

class GraphQL::Relay::Edge
  def initialize(node, connection); end

  def connection; end
  def cursor; end
  def inspect; end
  def node; end
  def parent; end
end

module GraphQL::Relay::EdgeType
  class << self
    def create_type(wrapped_type, name: T.unsafe(nil), &block); end
  end
end

module GraphQL::Relay::EdgesInstrumentation
  class << self
    def instrument(type, field); end
  end
end

class GraphQL::Relay::EdgesInstrumentation::EdgesResolve
  def initialize(edge_class:, resolve:); end

  def call(obj, args, ctx); end
end

class GraphQL::Relay::GlobalIdResolve
  def initialize(type:); end

  def call(obj, args, ctx); end
end

class GraphQL::Relay::MongoRelationConnection < ::GraphQL::Relay::RelationConnection

  private

  def limit_nodes(sliced_nodes, limit); end
  def relation_count(relation); end
  def relation_limit(relation); end
  def relation_offset(relation); end
end

class GraphQL::Relay::Mutation
  include(::GraphQL::Define::InstanceDefinable)
  extend(::GraphQL::Define::InstanceDefinable::ClassMethods)

  def initialize; end

  def arguments; end
  def arguments=(_); end
  def description; end
  def description=(_); end
  def field; end
  def fields; end
  def fields=(_); end
  def has_generated_return_type?; end
  def input_fields; end
  def input_type; end
  def name; end
  def name=(_); end
  def resolve=(new_resolve_proc); end
  def result_class; end
  def return_fields; end
  def return_interfaces; end
  def return_interfaces=(_); end
  def return_type; end
  def return_type=(_); end
end

module GraphQL::Relay::Mutation::Instrumentation
  class << self
    def instrument(type, field); end
  end
end

class GraphQL::Relay::Mutation::Resolve
  def initialize(mutation, resolve); end

  def call(obj, args, ctx); end

  private

  def build_result(mutation_result, args, ctx); end
end

class GraphQL::Relay::Mutation::Result
  def initialize(client_mutation_id:, result:); end

  def client_mutation_id; end

  class << self
    def define_subclass(mutation_defn); end
    def mutation; end
    def mutation=(_); end
  end
end

module GraphQL::Relay::Node
  class << self
    def field(**kwargs, &block); end
    def interface; end
    def plural_field(**kwargs, &block); end
  end
end

GraphQL::Relay::PageInfo = T.let(T.unsafe(nil), GraphQL::ObjectType)

class GraphQL::Relay::RangeAdd
  def initialize(collection:, item:, parent: T.unsafe(nil), context: T.unsafe(nil), edge_class: T.unsafe(nil)); end

  def connection; end
  def edge; end
  def parent; end
end

class GraphQL::Relay::RelationConnection < ::GraphQL::Relay::BaseConnection
  def cursor_from_node(item); end
  def first; end
  def has_next_page; end
  def has_previous_page; end
  def last; end

  private

  def limit_nodes(sliced_nodes, limit); end
  def offset_from_cursor(cursor); end
  def paged_nodes; end
  def paged_nodes_offset; end
  def relation_count(relation); end
  def relation_limit(relation); end
  def relation_offset(relation); end
  def sliced_nodes; end
  def sliced_nodes_count; end
end

module GraphQL::Relay::TypeExtensions
  def connection_type; end
  def define_connection(**kwargs, &block); end
  def define_edge(**kwargs, &block); end
  def edge_type; end
end

class GraphQL::RequiredImplementationMissingError < ::GraphQL::Error
end

module GraphQL::Ruby2Keywords
end

class GraphQL::RuntimeTypeError < ::GraphQL::Error
end

GraphQL::STRING_TYPE = T.let(T.unsafe(nil), GraphQL::ScalarType)

class GraphQL::ScalarType < ::GraphQL::BaseType
  def initialize; end

  def coerce=(proc); end
  def coerce_input=(coerce_input_fn); end
  def coerce_result(value, ctx = T.unsafe(nil)); end
  def coerce_result=(coerce_result_fn); end
  def kind; end

  private

  def coerce_non_null_input(value, ctx); end
  def ensure_two_arg(callable, method_name); end
  def raw_coercion_input(value); end
  def validate_non_null_input(value, ctx); end
end

module GraphQL::ScalarType::NoOpCoerce
  class << self
    def call(val, ctx); end
  end
end

class GraphQL::Schema
  include(::GraphQL::Define::InstanceDefinable)
  include(::GraphQL::Schema::LazyHandlingMethods)
  extend(::Forwardable)
  extend(::GraphQL::Schema::Member::AcceptsDefinition)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Member::HasAstNode)
  extend(::GraphQL::Define::InstanceDefinable::ClassMethods)
  extend(::GraphQL::Schema::FindInheritedValue)
  extend(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  extend(::GraphQL::Schema::LazyHandlingMethods)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)

  def initialize; end

  def _schema_class; end
  def accessible?(member, context); end
  def analysis_engine; end
  def analysis_engine=(_); end
  def as_json(only: T.unsafe(nil), except: T.unsafe(nil), context: T.unsafe(nil)); end
  def ast_node; end
  def ast_node=(_); end
  def authorization(*args); end
  def call_on_type_class(member, method_name, context, default:); end
  def check_resolved_type(type, object, ctx = T.unsafe(nil)); end
  def connections; end
  def connections=(_); end
  def context_class; end
  def context_class=(_); end
  def cursor_encoder; end
  def cursor_encoder=(_); end
  def default_filter; end
  def default_mask; end
  def default_mask=(_); end
  def default_max_page_size; end
  def default_max_page_size=(_); end
  def define(**kwargs, &block); end
  def directive(*args, &block); end
  def directives; end
  def directives=(_); end
  def disable_introspection_entry_points; end
  def disable_introspection_entry_points=(_); end
  def disable_introspection_entry_points?; end
  def disable_schema_introspection_entry_point; end
  def disable_schema_introspection_entry_point=(_); end
  def disable_schema_introspection_entry_point?; end
  def disable_type_introspection_entry_point; end
  def disable_type_introspection_entry_point=(_); end
  def disable_type_introspection_entry_point?; end
  def error_bubbling; end
  def error_bubbling=(_); end
  def error_handler(*args, &block); end
  def execute(query_str = T.unsafe(nil), **kwargs); end
  def execution_strategy_for_operation(operation); end
  def find(path); end
  def get_field(parent_type, field_name); end
  def get_fields(type); end
  def get_type(type_name); end
  def graphql_definition; end
  def id_from_object(object, type, ctx); end
  def id_from_object=(new_proc); end
  def id_from_object_proc; end
  def inaccessible_fields(*args, &block); end
  def inspect; end
  def instrument(instrumentation_type, instrumenter); end
  def instrumenters; end
  def instrumenters=(_); end
  def interpreter=(_); end
  def interpreter?; end
  def introspection_namespace; end
  def introspection_namespace=(_); end
  def introspection_system; end
  def lazy_methods; end
  def lazy_methods=(_); end
  def max_complexity; end
  def max_complexity=(_); end
  def max_depth; end
  def max_depth=(_); end
  def middleware; end
  def middleware=(_); end
  def multiplex(queries, **kwargs); end
  def multiplex_analyzers; end
  def multiplex_analyzers=(_); end
  def mutation; end
  def mutation=(_); end
  def mutation_execution_strategy; end
  def mutation_execution_strategy=(_); end
  def new_connections?; end
  def object_from_id(id, ctx); end
  def object_from_id=(new_proc); end
  def object_from_id_proc; end
  def operation_store; end
  def operation_store=(_); end
  def orphan_types; end
  def orphan_types=(_); end
  def parse_error(err, ctx); end
  def parse_error=(new_proc); end
  def possible_types(type_defn, context = T.unsafe(nil)); end
  def query; end
  def query=(_); end
  def query_analyzers; end
  def query_analyzers=(_); end
  def query_execution_strategy; end
  def query_execution_strategy=(_); end
  def raise_definition_error; end
  def raise_definition_error=(_); end
  def references_to(type_name = T.unsafe(nil)); end
  def remove_handler(*args, &block); end
  def rescue_from(*args, &block); end
  def resolve_type(type, object, ctx = T.unsafe(nil)); end
  def resolve_type=(new_resolve_type_proc); end
  def resolve_type_proc; end
  def root_type_for_operation(operation); end
  def root_types; end
  def static_validator; end
  def subscription; end
  def subscription=(_); end
  def subscription_execution_strategy; end
  def subscription_execution_strategy=(_); end
  def subscriptions; end
  def subscriptions=(_); end
  def to_definition(only: T.unsafe(nil), except: T.unsafe(nil), context: T.unsafe(nil)); end
  def to_document(only: T.unsafe(nil), except: T.unsafe(nil), context: T.unsafe(nil)); end
  def to_json(*args); end
  def tracers; end
  def type_error(err, ctx); end
  def type_error=(new_proc); end
  def type_from_ast(ast_node, context:); end
  def types; end
  def unauthorized_field(*args, &block); end
  def unauthorized_object(*args, &block); end
  def union_memberships(type); end
  def using_ast_analysis?; end
  def validate(string_or_document, rules: T.unsafe(nil), context: T.unsafe(nil)); end
  def visible?(member, context); end

  protected

  def rescue_middleware; end
  def rescues?; end

  private

  def initialize_copy(other); end
  def rebuild_artifacts; end
  def with_definition_error_check; end

  class << self
    def accessible?(member, ctx); end
    def analysis_engine; end
    def analysis_engine=(_); end
    def as_json(only: T.unsafe(nil), except: T.unsafe(nil), context: T.unsafe(nil)); end
    def authorization(*args); end
    def connections; end
    def connections=(_); end
    def context_class(new_context_class = T.unsafe(nil)); end
    def cursor_encoder(new_encoder = T.unsafe(nil)); end
    def default_directives; end
    def default_execution_strategy; end
    def default_execution_strategy=(_); end
    def default_filter; end
    def default_mask(new_mask = T.unsafe(nil)); end
    def default_max_page_size(new_default_max_page_size = T.unsafe(nil)); end
    def directive(new_directive); end
    def directives(new_directives = T.unsafe(nil)); end
    def disable_introspection_entry_points; end
    def disable_introspection_entry_points?; end
    def disable_schema_introspection_entry_point; end
    def disable_schema_introspection_entry_point?; end
    def disable_type_introspection_entry_point; end
    def disable_type_introspection_entry_point?; end
    def error_bubbling(new_error_bubbling = T.unsafe(nil)); end
    def error_bubbling=(_); end
    def error_handler; end
    def error_handler=(_); end

    sig { params(query_str: String, kwargs: T.untyped).returns(T::Hash[String, T.untyped]) }
    def execute(query_str = T.unsafe(nil), **kwargs); end

    def execution_strategy_for_operation(*args, &block); end
    def find(path); end
    def from_definition(definition_or_path, default_resolve: T.unsafe(nil), interpreter: T.unsafe(nil), parser: T.unsafe(nil), using: T.unsafe(nil)); end
    def from_introspection(introspection_result); end
    def get_field(type_or_name, field_name); end
    def get_fields(type); end
    def get_type(type_name); end
    def graphql_definition; end
    def id_from_object(object, type, ctx); end
    def id_from_object=(*args, &block); end
    def id_from_object_proc(*args, &block); end
    def inaccessible_fields(error); end
    def inherited(child_class); end
    def instrument(instrument_step, instrumenter, options = T.unsafe(nil)); end
    def instrumenters; end
    def interpreter=(_); end
    def interpreter?; end
    def introspection(new_introspection_namespace = T.unsafe(nil)); end
    def introspection_system; end
    def lazy_resolve(lazy_class, value_method); end
    def max_complexity(max_complexity = T.unsafe(nil)); end
    def max_complexity=(_); end
    def max_depth(new_max_depth = T.unsafe(nil)); end
    def max_depth=(_); end
    def metadata(*args, &block); end
    def middleware(new_middleware = T.unsafe(nil)); end
    def multiplex(queries, **kwargs); end
    def multiplex_analyzer(new_analyzer); end
    def multiplex_analyzers; end
    def mutation(new_mutation_object = T.unsafe(nil)); end
    def mutation_execution_strategy(new_mutation_execution_strategy = T.unsafe(nil)); end
    def new_connections?; end
    def object_from_id(node_id, ctx); end
    def object_from_id=(*args, &block); end
    def object_from_id_proc(*args, &block); end
    def operation_store; end
    def operation_store=(_); end
    def orphan_types(*new_orphan_types); end
    def parse_error(parse_err, ctx); end
    def plugins; end
    def possible_types(type = T.unsafe(nil), context = T.unsafe(nil)); end
    def query(new_query_object = T.unsafe(nil)); end
    def query_analyzer(new_analyzer); end
    def query_analyzers; end
    def query_execution_strategy(new_query_execution_strategy = T.unsafe(nil)); end
    def redefine(*args, &block); end
    def references_to(to_type = T.unsafe(nil), from: T.unsafe(nil)); end
    def remove_handler(*args, &block); end
    def rescue_from(*err_classes, &handler_block); end
    def rescues; end
    def resolve_type(type, obj, ctx); end
    def root_type_for_operation(operation); end
    def root_types; end
    def static_validator; end
    def subscription(new_subscription_object = T.unsafe(nil)); end
    def subscription_execution_strategy(new_subscription_execution_strategy = T.unsafe(nil)); end
    def subscriptions; end
    def subscriptions=(_); end
    def to_definition(only: T.unsafe(nil), except: T.unsafe(nil), context: T.unsafe(nil)); end
    def to_document; end
    def to_json(**args); end
    def tracer(new_tracer); end
    def tracers; end
    def type_error(type_err, ctx); end
    def type_from_ast(ast_node, context: T.unsafe(nil)); end
    def types; end
    def unauthorized_field(unauthorized_error); end
    def unauthorized_object(unauthorized_error); end
    def union_memberships(type = T.unsafe(nil)); end
    def use(plugin, **kwargs); end
    def using_ast_analysis?; end
    def validate(*args, &block); end
    def visible?(member, ctx); end

    private

    def add_type(type, owner:, late_types:, path:); end
    def add_type_and_traverse(t, root:); end
    def all_middleware; end
    def lazy_methods; end
    def non_introspection_types; end
    def own_directives; end
    def own_instrumenters; end
    def own_middleware; end
    def own_multiplex_analyzers; end
    def own_orphan_types; end
    def own_plugins; end
    def own_possible_types; end
    def own_query_analyzers; end
    def own_rescues; end
    def own_tracers; end
    def own_types; end
    def own_union_memberships; end
    def update_type_owner(owner, type); end
  end
end

class GraphQL::Schema::Argument
  include(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)
  include(::GraphQL::Schema::Member::AcceptsDefinition::InitializeExtension)
  include(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  include(::GraphQL::Schema::Member::AcceptsDefinition)
  include(::GraphQL::Schema::Member::HasPath)
  include(::GraphQL::Schema::Member::HasAstNode)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)

  def access(*args); end
  def accessible?(context); end
  def authorize(*args); end
  def authorized?(obj, value, ctx); end
  def authorized_as_type?(obj, value, ctx, as_type:); end
  def default_value; end
  def default_value?; end
  def description(text = T.unsafe(nil)); end
  def description=(_); end
  def from_resolver?; end
  def graphql_name; end
  def keyword; end
  def loads; end
  def name; end
  def owner; end
  def prepare; end
  def prepare_value(obj, value, context: T.unsafe(nil)); end
  def statically_coercible?; end
  def type; end
  def type=(_); end
  def view(*args); end
  def visible?(context); end

  class << self
    def access(*args); end
    def authorize(*args); end
    def view(*args); end
  end
end

GraphQL::Schema::Argument::NO_DEFAULT = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::BUILT_IN_TYPES = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

module GraphQL::Schema::Base64Encoder
  class << self
    def decode(encoded_text, nonce: T.unsafe(nil)); end
    def encode(unencoded_text, nonce: T.unsafe(nil)); end
  end
end

module GraphQL::Schema::CatchallMiddleware
  class << self
    def call(parent_type, parent_object, field_definition, field_args, query_context); end
  end
end

GraphQL::Schema::CatchallMiddleware::MESSAGE = T.let(T.unsafe(nil), String)

class GraphQL::Schema::CyclicalDefinitionError < ::GraphQL::Error
end

GraphQL::Schema::DYNAMIC_FIELDS = T.let(T.unsafe(nil), T::Array[T.untyped])

module GraphQL::Schema::DefaultParseError
  class << self
    def call(parse_error, ctx); end
  end
end

module GraphQL::Schema::DefaultTypeError
  class << self
    def call(type_error, ctx); end
  end
end

class GraphQL::Schema::Directive < ::GraphQL::Schema::Member
  include(::GraphQL::Schema::Member::HasArguments::ArgumentObjectLoader)
  extend(::GraphQL::Schema::Member::HasArguments)
  extend(::GraphQL::Schema::Member::HasArguments::ArgumentClassAccessor)

  class << self
    def default_directive(new_default_directive = T.unsafe(nil)); end
    def default_directive?; end
    def default_graphql_name; end
    def include?(_object, arguments, context); end
    def locations(*new_locations); end
    def on_field?; end
    def on_fragment?; end
    def on_operation?; end
    def resolve(object, arguments, context); end
    def static_include?(_arguments, _context); end
    def to_graphql; end
  end
end

GraphQL::Schema::Directive::ARGUMENT_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::DEFAULT_DEPRECATION_REASON = T.let(T.unsafe(nil), String)

class GraphQL::Schema::Directive::Deprecated < ::GraphQL::Schema::Directive
end

GraphQL::Schema::Directive::ENUM = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::ENUM_VALUE = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::FIELD = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::FIELD_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::FRAGMENT_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::FRAGMENT_SPREAD = T.let(T.unsafe(nil), Symbol)

class GraphQL::Schema::Directive::Feature < ::GraphQL::Schema::Directive
  class << self
    def enabled?(flag_name, object, context); end
    def include?(object, arguments, context); end
  end
end

GraphQL::Schema::Directive::INLINE_FRAGMENT = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::INPUT_FIELD_DEFINITION = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::INPUT_OBJECT = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::INTERFACE = T.let(T.unsafe(nil), Symbol)

class GraphQL::Schema::Directive::Include < ::GraphQL::Schema::Directive
  class << self
    def static_include?(args, ctx); end
  end
end

GraphQL::Schema::Directive::LOCATIONS = T.let(T.unsafe(nil), T::Array[T.untyped])

GraphQL::Schema::Directive::LOCATION_DESCRIPTIONS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

GraphQL::Schema::Directive::MUTATION = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::OBJECT = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::QUERY = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::SCALAR = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::SCHEMA = T.let(T.unsafe(nil), Symbol)

GraphQL::Schema::Directive::SUBSCRIPTION = T.let(T.unsafe(nil), Symbol)

class GraphQL::Schema::Directive::Skip < ::GraphQL::Schema::Directive
  class << self
    def static_include?(args, ctx); end
  end
end

class GraphQL::Schema::Directive::Transform < ::GraphQL::Schema::Directive
  class << self
    def resolve(object, arguments, context); end
  end
end

GraphQL::Schema::Directive::Transform::TRANSFORMS = T.let(T.unsafe(nil), T::Array[T.untyped])

GraphQL::Schema::Directive::UNION = T.let(T.unsafe(nil), Symbol)

class GraphQL::Schema::DuplicateTypeNamesError < ::GraphQL::Error
  def initialize(type_name:, first_definition:, second_definition:, path:); end
end

class GraphQL::Schema::Enum < ::GraphQL::Schema::Member
  extend(::GraphQL::Schema::Member::AcceptsDefinition)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Member::ValidatesInput)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)

  def access(*args); end
  def authorize(*args); end
  def view(*args); end

  class << self
    def access(*args); end
    def authorize(*args); end
    def coerce_input(value_name, ctx); end
    def coerce_result(value, ctx); end
    def enum_value_class(new_enum_value_class = T.unsafe(nil)); end
    def inherited(child_class); end
    def kind; end
    def validate_non_null_input(value_name, ctx); end

    # Define a value for this enum
    #
    # _@param_ `graphql_name` - the GraphQL value for this, usually `SCREAMING_CASE`
    #
    # _@param_ `description` - the GraphQL description for this value, present in documentation
    #
    # _@param_ `value` - , the translated Ruby value for this object (defaults to `graphql_name`)
    #
    # _@param_ `deprecation_reason` - if this object is deprecated, include a message here
    #
    # _@see_ `{Schema::EnumValue}` — which handles these inputs by default
    sig { params(graphql_name: T.any(String, Symbol), positional_description: String,  value: Object, description: String, deprecation_reason: String, block: T.untyped).void }
    def value(graphql_name, positional_description = '', value: nil, description: nil, deprecation_reason: nil, &block); end

    sig { returns(T::Hash[String, GraphQL::Schema::EnumValue]) }
    def values; end

    def view(*args); end

    private

    def own_values; end
  end
end

class GraphQL::Schema::Enum::UnresolvedValueError < ::GraphQL::EnumType::UnresolvedValueError
end

class GraphQL::Schema::EnumValue < ::GraphQL::Schema::Member
  include(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)
  include(::GraphQL::Schema::Member::AcceptsDefinition::InitializeExtension)
  include(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  include(::GraphQL::Schema::Member::AcceptsDefinition)
  include(::GraphQL::Schema::Member::HasPath)
  include(::GraphQL::Schema::Member::HasAstNode)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)

  def access(*args); end
  def accessible?(_ctx); end
  def authorize(*args); end
  def authorized?(_ctx); end
  def deprecation_reason; end
  def deprecation_reason=(_); end
  def description(new_desc = T.unsafe(nil)); end
  def graphql_name; end
  def owner; end
  def value(new_val = T.unsafe(nil)); end
  def view(*args); end
  def visible?(_ctx); end

  class << self
    def access(*args); end
    def authorize(*args); end
    def view(*args); end
  end
end

class GraphQL::Schema::Field
  include(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)
  include(::GraphQL::Schema::Member::AcceptsDefinition::InitializeExtension)
  include(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  include(::GraphQL::Schema::Member::AcceptsDefinition)
  include(::GraphQL::Schema::Member::HasArguments)
  include(::GraphQL::Schema::Member::HasArguments::ArgumentObjectLoader)
  include(::GraphQL::Schema::Member::HasAstNode)
  include(::GraphQL::Schema::Member::HasPath)
  include(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Member::HasArguments::ArgumentClassAccessor)
  extend(::GraphQL::Schema::FindInheritedValue)
  extend(::GraphQL::Schema::FindInheritedValue::EmptyObjects)

  def access(*args); end
  def accessible?(context); end
  def authorize(*args); end
  def authorized?(object, args, context); end
  def complexity(new_complexity = T.unsafe(nil)); end
  def connection?; end
  def deprecation_reason; end
  def deprecation_reason=(_); end
  def description(text = T.unsafe(nil)); end
  def description=(_); end
  def extension(extension, options = T.unsafe(nil)); end
  def extensions(new_extensions = T.unsafe(nil)); end
  def extras(new_extras = T.unsafe(nil)); end
  def fetch_extra(extra_name, ctx); end
  def graphql_name; end
  def has_max_page_size?; end
  def introspection?; end
  def max_page_size; end
  def method_conflict_warning?; end
  def method_str; end
  def method_sym; end
  def mutation; end
  def name; end
  def original_name; end
  def owner; end
  def owner=(_); end
  def relay_node_field; end
  def resolve(object, args, ctx); end
  def resolve_field(obj, args, ctx); end
  def resolve_field_method(obj, ruby_kwargs, ctx); end
  def resolver; end
  def resolver_method; end
  def scoped?; end
  def subscription_scope; end
  def subscription_scope=(_); end
  def trace; end
  def type; end
  def type=(_); end
  def view(*args); end
  def visible?(context); end

  private

  def public_send_field(obj, ruby_kwargs, field_ctx); end
  def run_extensions_before_resolve(memos, obj, args, ctx, idx: T.unsafe(nil)); end
  def to_ruby_args(obj, graphql_args, field_ctx); end
  def with_extensions(obj, args, ctx); end

  class << self
    def access(*args); end
    def authorize(*args); end
    def connection_extension(new_extension_class = T.unsafe(nil)); end
    def from_options(name = T.unsafe(nil), type = T.unsafe(nil), desc = T.unsafe(nil), resolver: T.unsafe(nil), mutation: T.unsafe(nil), subscription: T.unsafe(nil), **kwargs, &block); end
    def view(*args); end
  end
end

class GraphQL::Schema::Field::ConnectionExtension < ::GraphQL::Schema::FieldExtension
  def after_resolve(value:, object:, arguments:, context:, memo:); end
  def apply; end
  def resolve(object:, arguments:, context:); end
end

GraphQL::Schema::Field::NO_ARGS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

class GraphQL::Schema::Field::ScopeExtension < ::GraphQL::Schema::FieldExtension
  def after_resolve(value:, context:, **rest); end
end

class GraphQL::Schema::FieldExtension
  def initialize(field:, options:); end

  def after_resolve(object:, arguments:, context:, value:, memo:); end
  def apply; end
  def field; end
  def options; end
  def resolve(object:, arguments:, context:); end
end

module GraphQL::Schema::FindInheritedValue
  include(::GraphQL::Schema::FindInheritedValue::EmptyObjects)

  private

  def find_inherited_value(method_name, default_value = T.unsafe(nil)); end

  class << self
    def extended(child_cls); end
    def included(child_cls); end
  end
end

module GraphQL::Schema::FindInheritedValue::EmptyObjects
end

GraphQL::Schema::FindInheritedValue::EmptyObjects::EMPTY_ARRAY = T.let(T.unsafe(nil), T::Array[T.untyped])

GraphQL::Schema::FindInheritedValue::EmptyObjects::EMPTY_HASH = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

class GraphQL::Schema::Finder
  def initialize(schema); end

  def find(path); end

  private

  def find_in_directive(directive, path:); end
  def find_in_enum_type(enum_type, path:); end
  def find_in_field(field, path:); end
  def find_in_fields_type(type, kind:, path:); end
  def find_in_input_object(input_object, path:); end
  def find_in_type(type, path:); end
  def schema; end
end

class GraphQL::Schema::Finder::MemberNotFoundError < ::ArgumentError
end

class GraphQL::Schema::InputObject < ::GraphQL::Schema::Member
  include(::GraphQL::Schema::Member::HasArguments::ArgumentObjectLoader)
  include(::GraphQL::Dig)
  extend(::GraphQL::Schema::Member::AcceptsDefinition)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::Forwardable)
  extend(::GraphQL::Schema::Member::HasArguments)
  extend(::GraphQL::Schema::Member::HasArguments::ArgumentClassAccessor)
  extend(::GraphQL::Schema::Member::HasArguments::ArgumentObjectLoader)
  extend(::GraphQL::Schema::Member::ValidatesInput)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)

  def initialize(arguments = T.unsafe(nil), context:, defaults_used:, ruby_kwargs: T.unsafe(nil)); end

  def [](key); end
  def access(*args); end
  def any?(*args, &block); end
  def arguments; end
  def authorize(*args); end

  sig { returns(GraphQL::Query::Context) }
  def context; end

  def each(*args, &block); end
  def empty?(*args, &block); end
  def key?(key); end
  def keys(*args, &block); end
  def map(*args, &block); end
  def prepare; end
  def to_h; end
  def to_hash; end
  def to_kwargs; end
  def unwrap_value(value); end
  def values(*args, &block); end
  def view(*args); end

  class << self
    def access(*args); end
    def argument(*args, **kwargs, &block); end
    def arguments_class; end
    def arguments_class=(_); end
    def authorize(*args); end
    def coerce_input(value, ctx); end
    def coerce_result(value, ctx); end
    def kind; end
    def validate_non_null_input(input, ctx); end
    def view(*args); end
  end
end

module GraphQL::Schema::Interface
  include(::GraphQL::Schema::Member::GraphQLTypeNames)
  extend(::GraphQL::Schema::Member::AcceptsDefinition)
  extend(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  extend(::GraphQL::Relay::TypeExtensions)
  extend(::GraphQL::Schema::FindInheritedValue)
  extend(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  extend(::GraphQL::Schema::Member::BaseDSLMethods)
  extend(::GraphQL::Schema::Member::TypeSystemHelpers)
  extend(::GraphQL::Schema::Member::HasFields)
  extend(::GraphQL::Schema::Member::HasPath)
  extend(::GraphQL::Schema::Member::RelayShortcuts)
  extend(::GraphQL::Schema::Member::Scoped)
  extend(::GraphQL::Schema::Member::HasAstNode)
  extend(::GraphQL::Schema::Member::HasUnresolvedTypeError)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Interface::DefinitionMethods)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)

  mixes_in_class_methods(GraphQL::Schema::Interface::DefinitionMethods)

  def unwrap; end
end

module GraphQL::Schema::Interface::DefinitionMethods
  include(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)
  include(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  include(::GraphQL::Relay::TypeExtensions)
  include(::GraphQL::Schema::FindInheritedValue)
  include(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  include(::GraphQL::Schema::Member::BaseDSLMethods)
  include(::GraphQL::Schema::Member::TypeSystemHelpers)
  include(::GraphQL::Schema::Member::HasFields)
  include(::GraphQL::Schema::Member::HasPath)
  include(::GraphQL::Schema::Member::RelayShortcuts)
  include(::GraphQL::Schema::Member::Scoped)
  include(::GraphQL::Schema::Member::HasAstNode)
  include(::GraphQL::Schema::Member::HasUnresolvedTypeError)
  include(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)

  def access(*args); end
  def accessible?(context); end
  def authorize(*args); end
  def definition_methods(&block); end
  def included(child_class); end
  def kind; end
  def orphan_types(*types); end
  def type_membership_class(membership_class = T.unsafe(nil)); end
  def view(*args); end
  def visible?(context); end

  protected

  def interfaces; end
  def own_interfaces; end
end

class GraphQL::Schema::IntrospectionSystem
  def initialize(schema); end

  def dynamic_field(name:); end
  def dynamic_fields; end
  def entry_point(name:); end
  def entry_points; end
  def possible_types; end
  def resolve_late_bindings; end
  def types; end

  private

  def dup_type_class(type_class); end
  def get_fields_from_class(class_sym:); end
  def load_constant(class_name); end
  def resolve_late_binding(late_bound_type); end
end

class GraphQL::Schema::IntrospectionSystem::PerFieldProxyResolve
  def initialize(object_class:, inner_resolve:); end

  def call(obj, args, ctx); end
end

class GraphQL::Schema::InvalidDocumentError < ::GraphQL::Error
end

class GraphQL::Schema::InvalidTypeError < ::GraphQL::Error
end

class GraphQL::Schema::LateBoundType
  def initialize(local_name); end

  def graphql_name; end
  def inspect; end
  def name; end
  def to_list_type; end
  def to_non_null_type; end
  def to_s; end
  def unwrap; end
end

module GraphQL::Schema::LazyHandlingMethods
  def after_any_lazies(maybe_lazies); end
  def after_lazy(value, &block); end
  def lazy?(obj); end
  def lazy_method_name(obj); end
  def sync_lazy(value); end
end

class GraphQL::Schema::List < ::GraphQL::Schema::Wrapper
  include(::GraphQL::Schema::Member::ValidatesInput)

  def coerce_input(value, ctx); end
  def coerce_result(value, ctx); end
  def description; end
  def graphql_name; end
  def kind; end
  def list?; end
  def to_graphql; end
  def to_type_signature; end
  def validate_non_null_input(value, ctx); end

  private

  def ensure_array(value); end
end

module GraphQL::Schema::Loader
  extend(::GraphQL::Schema::Loader)

  def load(introspection_result); end

  class << self
    def build_arguments(arg_owner, args, type_resolver); end
    def build_fields(type_defn, fields, type_resolver); end

    private

    def define_type(type, type_resolver); end
    def extract_default_value(default_value_str, input_value_ast); end
    def resolve_type(types, type); end
  end
end

GraphQL::Schema::Loader::NullScalarCoerce = T.let(T.unsafe(nil), Proc)

class GraphQL::Schema::Member
  include(::GraphQL::Schema::Member::GraphQLTypeNames)
  extend(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  extend(::GraphQL::Relay::TypeExtensions)
  extend(::GraphQL::Schema::FindInheritedValue)
  extend(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  extend(::GraphQL::Schema::Member::BaseDSLMethods)
  extend(::GraphQL::Schema::Member::BaseDSLMethods::ConfigurationExtension)
  extend(::GraphQL::Schema::Member::TypeSystemHelpers)
  extend(::GraphQL::Schema::Member::Scoped)
  extend(::GraphQL::Schema::Member::RelayShortcuts)
  extend(::GraphQL::Schema::Member::HasPath)
  extend(::GraphQL::Schema::Member::HasAstNode)
end

module GraphQL::Schema::Member::AcceptsDefinition
  mixes_in_class_methods(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)

  class << self
    def extended(child); end
    def included(child); end
  end
end

module GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods
  def accepts_definition(name); end
  def accepts_definition_methods; end
  def own_accepts_definition_methods; end
end

module GraphQL::Schema::Member::AcceptsDefinition::InitializeExtension
  def initialize(*args, **kwargs, &block); end

  def accepts_definition_methods; end
end

module GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension
  def to_graphql; end
end

module GraphQL::Schema::Member::BaseDSLMethods
  include(::GraphQL::Schema::FindInheritedValue)
  include(::GraphQL::Schema::FindInheritedValue::EmptyObjects)

  def accessible?(context); end
  def authorized?(object, context); end
  def default_graphql_name; end
  def description(new_description = T.unsafe(nil)); end
  def graphql_name(new_name = T.unsafe(nil)); end
  def introspection(new_introspection = T.unsafe(nil)); end
  def introspection?; end
  def mutation(mutation_class = T.unsafe(nil)); end
  def name(new_name = T.unsafe(nil)); end
  def overridden_graphql_name; end
  def to_graphql; end
  def unwrap; end
  def visible?(context); end
end

module GraphQL::Schema::Member::BaseDSLMethods::ConfigurationExtension
  def inherited(child_class); end
end

module GraphQL::Schema::Member::BuildType
  private

  def camelize(string); end
  def constantize(string); end
  def parse_type(type_expr, null:); end
  def to_type_name(something); end
  def underscore(string); end

  class << self
    def camelize(string); end
    def constantize(string); end
    def parse_type(type_expr, null:); end
    def to_type_name(something); end
    def underscore(string); end
  end
end

GraphQL::Schema::Member::BuildType::LIST_TYPE_ERROR = T.let(T.unsafe(nil), String)

module GraphQL::Schema::Member::CachedGraphQLDefinition
  def graphql_definition; end
  def type_class; end

  private

  def initialize_copy(original); end
end

module GraphQL::Schema::Member::GraphQLTypeNames
end

GraphQL::Schema::Member::GraphQLTypeNames::Boolean = T.let(T.unsafe(nil), String)

GraphQL::Schema::Member::GraphQLTypeNames::ID = T.let(T.unsafe(nil), String)

GraphQL::Schema::Member::GraphQLTypeNames::Int = T.let(T.unsafe(nil), String)

module GraphQL::Schema::Member::HasArguments
  include(::GraphQL::Schema::Member::HasArguments::ArgumentObjectLoader)

  mixes_in_class_methods(::GraphQL::Schema::Member::HasArguments::ArgumentClassAccessor)

  def add_argument(arg_defn); end
  def argument(*args, **kwargs, &block); end
  def argument_class(new_arg_class = T.unsafe(nil)); end
  def arguments; end
  def arguments_statically_coercible?; end
  def coerce_arguments(parent_object, values, context); end
  def get_argument(argument_name); end
  def own_arguments; end

  class << self
    def extended(cls); end
    def included(cls); end
  end
end

module GraphQL::Schema::Member::HasArguments::ArgumentClassAccessor
  def argument_class(new_arg_class = T.unsafe(nil)); end
end

module GraphQL::Schema::Member::HasArguments::ArgumentObjectLoader
  def load_application_object(argument, lookup_as_type, id, context); end
  def load_application_object_failed(err); end
  def object_from_id(type, id, context); end
end

module GraphQL::Schema::Member::HasAstNode
  def ast_node(new_ast_node = T.unsafe(nil)); end
end

module GraphQL::Schema::Member::HasFields
  def add_field(field_defn); end
  def field(*args, **kwargs, &block); end
  def field_class(new_field_class = T.unsafe(nil)); end
  def fields; end
  def get_field(field_name); end
  def global_id_field(field_name); end
  def own_fields; end
end

GraphQL::Schema::Member::HasFields::CONFLICT_FIELD_NAMES = T.let(T.unsafe(nil), T::Set[T.untyped])

GraphQL::Schema::Member::HasFields::GRAPHQL_RUBY_KEYWORDS = T.let(T.unsafe(nil), T::Array[T.untyped])

GraphQL::Schema::Member::HasFields::RUBY_KEYWORDS = T.let(T.unsafe(nil), T::Array[T.untyped])

module GraphQL::Schema::Member::HasPath
  def path; end
end

module GraphQL::Schema::Member::HasUnresolvedTypeError
  private

  def add_unresolved_type_error(child_class); end
end

module GraphQL::Schema::Member::Instrumentation
  private

  def after_query(_query); end
  def apply_proxy(field); end
  def before_query(query); end
  def instrument(type, field); end
  def list_depth(type, starting_at = T.unsafe(nil)); end

  class << self
    def after_query(_query); end
    def apply_proxy(field); end
    def before_query(query); end
    def instrument(type, field); end
    def list_depth(type, starting_at = T.unsafe(nil)); end
  end
end

class GraphQL::Schema::Member::Instrumentation::ProxiedResolve
  def initialize(inner_resolve:, list_depth:, inner_return_type:); end

  def call(obj, args, ctx); end

  private

  def execution_errors?(result); end
  def proxy_to_depth(inner_obj, depth, ctx); end
end

module GraphQL::Schema::Member::RelayShortcuts
  def connection_type; end
  def connection_type_class(new_connection_type_class = T.unsafe(nil)); end
  def edge_type; end
  def edge_type_class(new_edge_type_class = T.unsafe(nil)); end
end

module GraphQL::Schema::Member::Scoped
  def scope_items(items, context); end
end

module GraphQL::Schema::Member::TypeSystemHelpers
  def kind; end
  def list?; end
  def non_null?; end
  def to_list_type; end
  def to_non_null_type; end
  def to_type_signature; end
end

module GraphQL::Schema::Member::ValidatesInput
  def coerce_isolated_input(v); end
  def coerce_isolated_result(v); end
  def valid_input?(val, ctx); end
  def valid_isolated_input?(v); end
  def validate_input(val, ctx); end
end

class GraphQL::Schema::MiddlewareChain
  extend(::Forwardable)

  def initialize(steps: T.unsafe(nil), final_step: T.unsafe(nil)); end

  def <<(callable); end
  def ==(other); end
  def [](*args, &block); end
  def concat(callables); end
  def delete(*args, &block); end
  def final_step; end
  def first(*args, &block); end
  def insert(*args, &block); end
  def invoke(arguments); end
  def push(callable); end
  def steps; end

  private

  def add_middleware(callable); end
  def initialize_copy(other); end
  def invoke_core(index, arguments); end
  def wrap(callable); end
end

class GraphQL::Schema::MiddlewareChain::MiddlewareWrapper
  def initialize(callable); end

  def call(*args, &next_middleware); end
  def callable; end
end

class GraphQL::Schema::Mutation < ::GraphQL::Schema::Resolver
  extend(::GraphQL::Schema::Member::HasFields)
  extend(::GraphQL::Schema::Resolver::HasPayloadType)

  class << self
    def field(*args, **kwargs, &block); end
    def visible?(context); end

    private

    def generate_payload_type; end
  end
end

class GraphQL::Schema::NonNull < ::GraphQL::Schema::Wrapper
  include(::GraphQL::Schema::Member::ValidatesInput)

  def coerce_input(value, ctx); end
  def coerce_result(value, ctx); end
  def description; end
  def graphql_name; end
  def inspect; end
  def kind; end
  def list?; end
  def non_null?; end
  def to_graphql; end
  def to_type_signature; end
  def validate_input(value, ctx); end
end

module GraphQL::Schema::NullMask
  class << self
    def call(member, ctx); end
  end
end

class GraphQL::Schema::Object < ::GraphQL::Schema::Member
  include(::GraphQL::Execution::Interpreter::HandlesRawValue)
  extend(::GraphQL::Schema::Member::AcceptsDefinition)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Member::HasFields)
  extend(::GraphQL::Schema::Member::HasArguments)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)

  def initialize(object, context); end

  def access(*args); end
  def authorize(*args); end

  sig { returns(GraphQL::Query::Context) }
  def context; end

  def object; end
  def view(*args); end

  class << self
    def access(*args); end
    def authorize(*args); end
    def authorized_new(object, context); end
    def fields; end
    def implements(*new_interfaces, **options); end
    def inherited(child_class); end
    def interface_type_memberships; end
    def interfaces(context = T.unsafe(nil)); end
    def kind; end
    def own_interface_type_memberships; end
    def view(*args); end
  end
end

class GraphQL::Schema::PossibleTypes
  def initialize(schema); end

  def interface_implementers(ctx, type_defn); end
  def possible_types(type_defn, ctx); end
end

class GraphQL::Schema::Printer < ::GraphQL::Language::Printer
  def initialize(schema, context: T.unsafe(nil), only: T.unsafe(nil), except: T.unsafe(nil), introspection: T.unsafe(nil)); end

  def print_schema; end
  def print_type(type); end
  def schema; end
  def warden; end

  class << self
    def print_introspection_schema; end
    def print_schema(schema, **args); end
  end
end

class GraphQL::Schema::Printer::IntrospectionPrinter < ::GraphQL::Language::Printer
  def print_schema_definition(schema); end
end

class GraphQL::Schema::RelayClassicMutation < ::GraphQL::Schema::Mutation
  def resolve_with_support(**inputs); end

  class << self
    def field_options; end
    def input_object_class(new_class = T.unsafe(nil)); end
    def input_type(new_input_type = T.unsafe(nil)); end

    private

    def generate_input_type; end
  end
end

class GraphQL::Schema::RescueMiddleware
  def initialize; end

  def call(*args); end
  def remove_handler(*error_classes); end
  def rescue_from(*error_classes, &block); end
  def rescue_table; end

  private

  def attempt_rescue(err); end
end

class GraphQL::Schema::Resolver
  include(::GraphQL::Schema::Member::GraphQLTypeNames)
  include(::GraphQL::Schema::Member::HasArguments::ArgumentObjectLoader)
  include(::GraphQL::Schema::Member::HasPath)
  extend(::GraphQL::Schema::FindInheritedValue)
  extend(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  extend(::GraphQL::Schema::Member::BaseDSLMethods)
  extend(::GraphQL::Schema::Member::HasArguments)
  extend(::GraphQL::Schema::Member::HasArguments::ArgumentClassAccessor)
  extend(::GraphQL::Schema::Member::HasPath)

  def initialize(object:, context:, field:); end

  def authorized?(**inputs); end

  sig { returns(GraphQL::Query::Context) }
  def context; end

  def field; end
  def object; end
  def ready?(**args); end
  def resolve(**args); end
  def resolve_with_support(**args); end

  private

  def load_argument(name, value); end
  def load_arguments(args); end

  class << self
    def argument(*args, **kwargs, &block); end
    def arguments_loads_as_type; end
    def complexity(new_complexity = T.unsafe(nil)); end
    def extension(extension, **options); end
    def extensions; end
    def extras(new_extras = T.unsafe(nil)); end
    def field_options; end
    def null(allow_null = T.unsafe(nil)); end
    def resolve_method(new_method = T.unsafe(nil)); end
    def type(new_type = T.unsafe(nil), null: T.unsafe(nil)); end
    def type_expr; end

    private

    def own_arguments_loads_as_type; end
  end
end

module GraphQL::Schema::Resolver::HasPayloadType
  def field_class(new_class = T.unsafe(nil)); end
  def object_class(new_class = T.unsafe(nil)); end
  def payload_type(new_payload_type = T.unsafe(nil)); end
  def type(new_payload_type = T.unsafe(nil)); end
  def type_expr(new_payload_type = T.unsafe(nil)); end

  private

  def generate_payload_type; end
end

class GraphQL::Schema::Scalar < ::GraphQL::Schema::Member
  extend(::GraphQL::Schema::Member::AcceptsDefinition)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Member::ValidatesInput)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)

  def access(*args); end
  def authorize(*args); end
  def view(*args); end

  class << self
    def access(*args); end
    def authorize(*args); end
    def coerce_input(val, ctx); end
    def coerce_result(val, ctx); end
    def default_scalar(is_default = T.unsafe(nil)); end
    def default_scalar?; end
    def kind; end
    def validate_non_null_input(value, ctx); end
    def view(*args); end
  end
end

class GraphQL::Schema::Subscription < ::GraphQL::Schema::Resolver
  extend(::GraphQL::Schema::Resolver::HasPayloadType)
  extend(::GraphQL::Schema::Member::HasFields)

  def initialize(object:, context:, field:); end

  def load_application_object_failed(err); end
  def resolve(**args); end
  def resolve_subscribe(**args); end
  def resolve_update(**args); end
  def subscribe(args = T.unsafe(nil)); end
  def unsubscribe; end
  def update(args = T.unsafe(nil)); end

  class << self
    def field_options; end
    def subscription_scope(new_scope = T.unsafe(nil)); end
  end
end

class GraphQL::Schema::Subscription::EarlyTerminationError < ::StandardError
end

class GraphQL::Schema::Subscription::NoUpdateError < ::GraphQL::Schema::Subscription::EarlyTerminationError
end

GraphQL::Schema::Subscription::READING_SCOPE = T.let(T.unsafe(nil), Object)

class GraphQL::Schema::Subscription::UnsubscribedError < ::GraphQL::Schema::Subscription::EarlyTerminationError
end

class GraphQL::Schema::Timeout
  def initialize(max_seconds:); end

  def handle_timeout(error, query); end
  def max_seconds; end
  def trace(key, data); end

  class << self
    def use(schema, **options); end
  end
end

class GraphQL::Schema::Timeout::TimeoutError < ::GraphQL::ExecutionError
  def initialize(parent_type, field); end
end

class GraphQL::Schema::TimeoutMiddleware
  def initialize(max_seconds:, context_key: T.unsafe(nil), &block); end

  def call(parent_type, parent_object, field_definition, field_args, query_context); end
  def on_timeout(parent_type, parent_object, field_definition, field_args, field_context); end
end

class GraphQL::Schema::TimeoutMiddleware::TimeoutError < ::GraphQL::ExecutionError
  def initialize(parent_type, field_defn); end
end

class GraphQL::Schema::TimeoutMiddleware::TimeoutQueryProxy < ::SimpleDelegator
  def initialize(query, ctx); end

  def context; end
end

class GraphQL::Schema::Traversal
  def initialize(schema, introspection: T.unsafe(nil)); end

  def instrumented_field_map; end
  def type_map; end
  def type_reference_map; end
  def union_memberships; end

  private

  def resolve_late_bound_fields; end
  def rewrap_resolved_type(late_bound_type, resolved_inner_type); end
  def validate_type(member, context_description); end
  def visit(schema, member, context_description); end
  def visit_field_on_type(schema, type_defn, field_defn, dynamic_field: T.unsafe(nil)); end
  def visit_fields(schema, type_defn); end
end

module GraphQL::Schema::TypeExpression
  class << self
    def build_type(type_owner, ast_node); end

    private

    def wrap_type(type, wrapper_method); end
  end
end

class GraphQL::Schema::TypeMembership
  def initialize(abstract_type, object_type, **options); end

  def abstract_type; end
  def object_type; end
  def object_type=(_); end
  def visible?(_ctx); end
end

class GraphQL::Schema::Union < ::GraphQL::Schema::Member
  extend(::GraphQL::Schema::Member::AcceptsDefinition)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Member::HasUnresolvedTypeError)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)

  def access(*args); end
  def authorize(*args); end
  def view(*args); end

  class << self
    def access(*args); end
    def authorize(*args); end
    def inherited(child_class); end
    def kind; end
    def possible_types(*types, context: T.unsafe(nil), **options); end
    def type_membership_class(membership_class = T.unsafe(nil)); end
    def type_memberships; end
    def view(*args); end
  end
end

module GraphQL::Schema::UniqueWithinType
  private

  def decode(node_id, separator: T.unsafe(nil)); end
  def encode(type_name, object_value, separator: T.unsafe(nil)); end

  class << self
    def decode(node_id, separator: T.unsafe(nil)); end
    def default_id_separator; end
    def default_id_separator=(_); end
    def encode(type_name, object_value, separator: T.unsafe(nil)); end
  end
end

class GraphQL::Schema::UnresolvedLateBoundTypeError < ::GraphQL::Error
  def initialize(type:); end

  def type; end
end

class GraphQL::Schema::Validation
  class << self
    def validate(object); end
  end
end

GraphQL::Schema::Validation::RULES = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

module GraphQL::Schema::Validation::Rules
  class << self
    def assert_named_items_are_valid(item_name, get_items_proc); end
    def assert_property(property_name, *allowed_classes); end
    def assert_property_list_of(property_name, list_member_class); end
    def assert_property_mapping(property_name, from_class, to_class); end
    def count_at_least(item_name, minimum_count, get_items_proc); end
  end
end

GraphQL::Schema::Validation::Rules::ARGUMENTS_ARE_STRING_TO_ARGUMENT = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::ARGUMENTS_ARE_VALID = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::DEFAULT_VALUE_IS_VALID_FOR_TYPE = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::DESCRIPTION_IS_STRING_OR_NIL = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::FIELDS_ARE_VALID = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::HAS_AT_LEAST_ONE_ARGUMENT = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::HAS_AT_LEAST_ONE_FIELD = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::HAS_ONE_OR_MORE_POSSIBLE_TYPES = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::INTERFACES_ARE_IMPLEMENTED = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::NAME_IS_STRING = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::RESERVED_NAME = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::RESERVED_TYPE_NAME = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::SCHEMA_CAN_FETCH_IDS = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::SCHEMA_CAN_GENERATE_IDS = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::SCHEMA_CAN_RESOLVE_TYPES = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::SCHEMA_INSTRUMENTERS_ARE_VALID = T.let(T.unsafe(nil), Proc)

GraphQL::Schema::Validation::Rules::TYPE_IS_VALID_INPUT_TYPE = T.let(T.unsafe(nil), Proc)

class GraphQL::Schema::Warden
  def initialize(filter, context:, schema:); end

  def arguments(argument_owner); end
  def directives; end
  def enum_values(enum_defn); end
  def fields(type_defn); end
  def get_argument(parent_type, argument_name); end
  def get_field(parent_type, field_name); end
  def get_type(type_name); end
  def interfaces(obj_type); end
  def possible_types(type_defn); end
  def reachable_type?(type_name); end
  def reachable_types; end
  def root_type_for_operation(op_name); end
  def types; end

  private

  def field_on_visible_interface?(field_defn, type_defn); end
  def orphan_type?(type_defn); end
  def reachable_type_set; end
  def read_through; end
  def referenced?(type_defn); end
  def root_type?(type_defn); end
  def unfiltered_interfaces(type_defn); end
  def union_memberships(obj_type); end
  def visible?(member); end
  def visible_abstract_type?(type_defn); end
  def visible_argument?(arg_defn); end
  def visible_field?(owner_type, field_defn); end
  def visible_possible_types?(type_defn); end
  def visible_type?(type_defn); end
end

GraphQL::Schema::Warden::NO_REFERENCES = T.let(T.unsafe(nil), T::Array[T.untyped])

class GraphQL::Schema::Wrapper
  include(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  include(::GraphQL::Schema::Member::TypeSystemHelpers)

  def initialize(of_type); end

  def ==(other); end
  def of_type; end
  def to_graphql; end
  def unwrap; end
end

class GraphQL::StringEncodingError < ::GraphQL::RuntimeTypeError
  def initialize(str); end

  def string; end
end

class GraphQL::Subscriptions
  def initialize(schema:, **rest); end

  def build_id; end
  def delete_subscription(subscription_id); end
  def deliver(subscription_id, result); end
  def each_subscription_id(event); end
  def execute(subscription_id, event, object); end
  def execute_all(event, object); end
  def normalize_name(event_or_arg_name); end
  def read_subscription(subscription_id); end
  def trigger(event_name, args, object, scope: T.unsafe(nil)); end
  def write_subscription(query, events); end

  private

  def normalize_arguments(event_name, arg_owner, args); end

  class << self
    def use(defn, options = T.unsafe(nil)); end
  end
end

class GraphQL::Subscriptions::Event
  def initialize(name:, arguments:, field: T.unsafe(nil), context: T.unsafe(nil), scope: T.unsafe(nil)); end

  def arguments; end
  def context; end
  def name; end
  def topic; end

  class << self
    def serialize(name, arguments, field, scope:); end

    private

    def get_arg_definition(arg_owner, arg_name); end
    def stringify_args(arg_owner, args); end
  end
end

class GraphQL::Subscriptions::Instrumentation
  def initialize(schema:); end

  def after_query(query); end
  def before_query(query); end
  def instrument(type, field); end
end

class GraphQL::Subscriptions::Instrumentation::SubscriptionRegistrationResolve
  def initialize(inner_proc); end

  def call(obj, args, ctx); end
end

class GraphQL::Subscriptions::InvalidTriggerError < ::GraphQL::Error
end

module GraphQL::Subscriptions::Serialize
  private

  def dump(obj); end
  def dump_recursive(obj); end
  def load(str); end

  class << self
    def dump(obj); end
    def dump_recursive(obj); end
    def load(str); end

    private

    def dump_value(obj); end
    def load_value(value); end
  end
end

GraphQL::Subscriptions::Serialize::GLOBALID_KEY = T.let(T.unsafe(nil), String)

GraphQL::Subscriptions::Serialize::SYMBOL_KEY = T.let(T.unsafe(nil), String)

GraphQL::Subscriptions::Serialize::SYMBOL_KEYS_KEY = T.let(T.unsafe(nil), String)

module GraphQL::Subscriptions::SubscriptionRoot
  def field(*args, extensions: T.unsafe(nil), **rest, &block); end

  class << self
    def extended(child_cls); end
  end
end

class GraphQL::Subscriptions::SubscriptionRoot::Extension < ::GraphQL::Schema::FieldExtension
  def after_resolve(value:, context:, object:, arguments:, **rest); end

  private

  def arguments_without_field_extras(arguments:); end
end

module GraphQL::Subscriptions::SubscriptionRoot::InstanceMethods
  def skip_subscription_root(*_); end
end

module GraphQL::Tracing
  class << self
    def install(tracer); end
    def tracers; end
    def uninstall(tracer); end
  end
end

module GraphQL::Tracing::ActiveSupportNotificationsTracing
  class << self
    def trace(key, metadata); end
  end
end

GraphQL::Tracing::ActiveSupportNotificationsTracing::KEYS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

class GraphQL::Tracing::AppOpticsTracing < ::GraphQL::Tracing::PlatformTracing
  def platform_field_key(type, field); end
  def platform_trace(platform_key, _key, data); end

  private

  def gql_config; end
  def graphql_context(context, layer); end
  def graphql_multiplex(data); end
  def graphql_query(query); end
  def graphql_query_string(query_string); end
  def metadata(data, layer); end
  def multiplex_transaction_name(names); end
  def remove_comments(query); end
  def sanitize(query); end
  def span_name(key); end
  def transaction_name(query); end

  class << self
    def version; end
  end
end

GraphQL::Tracing::AppOpticsTracing::EXEC_KEYS = T.let(T.unsafe(nil), T::Array[T.untyped])

GraphQL::Tracing::AppOpticsTracing::PREP_KEYS = T.let(T.unsafe(nil), T::Array[T.untyped])

class GraphQL::Tracing::AppsignalTracing < ::GraphQL::Tracing::PlatformTracing
  def platform_authorized_key(type); end
  def platform_field_key(type, field); end
  def platform_resolve_type_key(type); end
  def platform_trace(platform_key, key, data); end
end

class GraphQL::Tracing::DataDogTracing < ::GraphQL::Tracing::PlatformTracing
  def analytics_available?; end
  def analytics_enabled?; end
  def analytics_sample_rate; end
  def platform_authorized_key(type); end
  def platform_field_key(type, field); end
  def platform_resolve_type_key(type); end
  def platform_trace(platform_key, key, data); end
  def service_name; end
  def tracer; end
end

class GraphQL::Tracing::NewRelicTracing < ::GraphQL::Tracing::PlatformTracing
  def initialize(options = T.unsafe(nil)); end

  def platform_authorized_key(type); end
  def platform_field_key(type, field); end
  def platform_resolve_type_key(type); end
  def platform_trace(platform_key, key, data); end
end

module GraphQL::Tracing::NullTracer
  private

  def trace(k, v); end

  class << self
    def trace(k, v); end
  end
end

class GraphQL::Tracing::PlatformTracing
  def initialize(options = T.unsafe(nil)); end

  def instrument(type, field); end
  def trace(key, data); end
  def trace_field(type, field); end

  private

  def options; end
  def platform_key_cache(ctx); end
  def transaction_name(query); end

  class << self
    def platform_keys; end
    def platform_keys=(_); end
    def use(schema_defn, options = T.unsafe(nil)); end
  end
end

class GraphQL::Tracing::PrometheusTracing < ::GraphQL::Tracing::PlatformTracing
  def initialize(opts = T.unsafe(nil)); end

  def platform_authorized_key(type); end
  def platform_field_key(type, field); end
  def platform_resolve_type_key(type); end
  def platform_trace(platform_key, key, data, &block); end

  private

  def instrument_execution(platform_key, key, data, &block); end
  def observe(platform_key, key, duration); end
end

GraphQL::Tracing::PrometheusTracing::DEFAULT_COLLECTOR_TYPE = T.let(T.unsafe(nil), String)

GraphQL::Tracing::PrometheusTracing::DEFAULT_WHITELIST = T.let(T.unsafe(nil), T::Array[T.untyped])

class GraphQL::Tracing::ScoutTracing < ::GraphQL::Tracing::PlatformTracing
  def initialize(options = T.unsafe(nil)); end

  def platform_authorized_key(type); end
  def platform_field_key(type, field); end
  def platform_resolve_type_key(type); end
  def platform_trace(platform_key, key, data); end
end

GraphQL::Tracing::ScoutTracing::INSTRUMENT_OPTS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

class GraphQL::Tracing::SkylightTracing < ::GraphQL::Tracing::PlatformTracing
  def initialize(options = T.unsafe(nil)); end

  def platform_authorized_key(type); end
  def platform_field_key(type, field); end
  def platform_resolve_type_key(type); end
  def platform_trace(platform_key, key, data); end
end

module GraphQL::Tracing::Traceable
  def trace(key, metadata, &block); end

  private

  def call_tracers(idx, key, metadata, &block); end
end

module GraphQL::TypeKinds
end

GraphQL::TypeKinds::ENUM = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

GraphQL::TypeKinds::INPUT_OBJECT = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

GraphQL::TypeKinds::INTERFACE = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

GraphQL::TypeKinds::LIST = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

GraphQL::TypeKinds::NON_NULL = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

GraphQL::TypeKinds::OBJECT = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

GraphQL::TypeKinds::SCALAR = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

GraphQL::TypeKinds::TYPE_KINDS = T.let(T.unsafe(nil), T::Array[T.untyped])

class GraphQL::TypeKinds::TypeKind
  def initialize(name, abstract: T.unsafe(nil), fields: T.unsafe(nil), wraps: T.unsafe(nil), input: T.unsafe(nil), description: T.unsafe(nil)); end

  def abstract?; end
  def composite?; end
  def description; end
  def enum?; end
  def fields?; end
  def input?; end
  def input_object?; end
  def interface?; end
  def list?; end
  def name; end
  def non_null?; end
  def object?; end
  def resolves?; end
  def scalar?; end
  def to_s; end
  def union?; end
  def wraps?; end
end

GraphQL::TypeKinds::UNION = T.let(T.unsafe(nil), GraphQL::TypeKinds::TypeKind)

module GraphQL::Types
end

class GraphQL::Types::BigInt < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(value, _ctx); end
    def coerce_result(value, _ctx); end
  end
end

class GraphQL::Types::Boolean < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(value, _ctx); end
    def coerce_result(value, _ctx); end
  end
end

class GraphQL::Types::Float < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(value, _ctx); end
    def coerce_result(value, _ctx); end
  end
end

class GraphQL::Types::ID < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(value, _ctx); end
    def coerce_result(value, _ctx); end
  end
end

class GraphQL::Types::ISO8601Date < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(str_value, _ctx); end
    def coerce_result(value, _ctx); end
  end
end

class GraphQL::Types::ISO8601DateTime < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(str_value, _ctx); end
    def coerce_result(value, _ctx); end
    def time_precision; end
    def time_precision=(value); end
  end
end

GraphQL::Types::ISO8601DateTime::DEFAULT_TIME_PRECISION = T.let(T.unsafe(nil), Integer)

class GraphQL::Types::Int < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(value, _ctx); end
    def coerce_result(value, ctx); end
  end
end

GraphQL::Types::Int::MAX = T.let(T.unsafe(nil), Integer)

GraphQL::Types::Int::MIN = T.let(T.unsafe(nil), Integer)

class GraphQL::Types::JSON < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(value, _context); end
    def coerce_result(value, _context); end
  end
end

module GraphQL::Types::Relay
end

class GraphQL::Types::Relay::BaseConnection < ::GraphQL::Types::Relay::BaseObject
  extend(::Forwardable)

  def cursor_from_node(*args, &block); end
  def edges; end
  def nodes; end
  def parent(*args, &block); end

  class << self
    def accessible?(ctx); end
    def authorized?(obj, ctx); end
    def edge_class; end
    def edge_type(edge_type_class, edge_class: T.unsafe(nil), node_type: T.unsafe(nil), nodes_field: T.unsafe(nil)); end
    def node_type; end
    def nodes_field; end
    def scope_items(items, context); end
    def visible?(ctx); end

    private

    def define_nodes_field; end
  end
end

class GraphQL::Types::Relay::BaseConnection::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Types::Relay::BaseEdge < ::GraphQL::Types::Relay::BaseObject
  class << self
    def accessible?(ctx); end
    def authorized?(obj, ctx); end
    def node_type(node_type = T.unsafe(nil), null: T.unsafe(nil)); end
    def visible?(ctx); end
  end
end

class GraphQL::Types::Relay::BaseEdge::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Types::Relay::BaseField < ::GraphQL::Schema::Field
  def initialize(edge_class: T.unsafe(nil), **rest, &block); end

  def to_graphql; end
end

module GraphQL::Types::Relay::BaseInterface
  include(::GraphQL::Schema::Member::GraphQLTypeNames)
  include(::GraphQL::Schema::Interface)
  extend(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  extend(::GraphQL::Relay::TypeExtensions)
  extend(::GraphQL::Schema::FindInheritedValue)
  extend(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  extend(::GraphQL::Schema::Member::BaseDSLMethods)
  extend(::GraphQL::Schema::Member::TypeSystemHelpers)
  extend(::GraphQL::Schema::Member::HasFields)
  extend(::GraphQL::Schema::Member::HasPath)
  extend(::GraphQL::Schema::Member::RelayShortcuts)
  extend(::GraphQL::Schema::Member::Scoped)
  extend(::GraphQL::Schema::Member::HasAstNode)
  extend(::GraphQL::Schema::Member::HasUnresolvedTypeError)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Interface::DefinitionMethods)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)
  extend(::GraphQL::Types::Relay::BaseInterface::DefinitionMethods)
end

module GraphQL::Types::Relay::BaseInterface::DefinitionMethods
  def default_relay(new_value); end
  def default_relay?; end
  def to_graphql; end
end

class GraphQL::Types::Relay::BaseInterface::UnresolvedTypeError < ::GraphQL::UnresolvedTypeError
end

class GraphQL::Types::Relay::BaseObject < ::GraphQL::Schema::Object
  class << self
    def default_relay(new_value); end
    def default_relay?; end
    def to_graphql; end
  end
end

class GraphQL::Types::Relay::BaseObject::InvalidNullError < ::GraphQL::InvalidNullError
end

module GraphQL::Types::Relay::Node
  include(::GraphQL::Schema::Member::GraphQLTypeNames)
  include(::GraphQL::Schema::Interface)
  include(::GraphQL::Types::Relay::BaseInterface)
  extend(::GraphQL::Schema::Member::CachedGraphQLDefinition)
  extend(::GraphQL::Relay::TypeExtensions)
  extend(::GraphQL::Schema::FindInheritedValue)
  extend(::GraphQL::Schema::FindInheritedValue::EmptyObjects)
  extend(::GraphQL::Schema::Member::BaseDSLMethods)
  extend(::GraphQL::Schema::Member::TypeSystemHelpers)
  extend(::GraphQL::Schema::Member::HasFields)
  extend(::GraphQL::Schema::Member::HasPath)
  extend(::GraphQL::Schema::Member::RelayShortcuts)
  extend(::GraphQL::Schema::Member::Scoped)
  extend(::GraphQL::Schema::Member::HasAstNode)
  extend(::GraphQL::Schema::Member::HasUnresolvedTypeError)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::AcceptsDefinitionDefinitionMethods)
  extend(::GraphQL::Schema::Interface::DefinitionMethods)
  extend(::GraphQL::Schema::Member::AcceptsDefinition::ToGraphQLExtension)
  extend(::GraphQL::Types::Relay::BaseInterface::DefinitionMethods)
  extend(::GraphQL::Types::Relay::Node::DefinitionMethods)
end

module GraphQL::Types::Relay::Node::DefinitionMethods
end

class GraphQL::Types::Relay::Node::UnresolvedTypeError < ::GraphQL::UnresolvedTypeError
end

GraphQL::Types::Relay::NodeField = T.let(T.unsafe(nil), GraphQL::Schema::Field)

GraphQL::Types::Relay::NodesField = T.let(T.unsafe(nil), GraphQL::Schema::Field)

class GraphQL::Types::Relay::PageInfo < ::GraphQL::Types::Relay::BaseObject
end

class GraphQL::Types::Relay::PageInfo::InvalidNullError < ::GraphQL::InvalidNullError
end

class GraphQL::Types::String < ::GraphQL::Schema::Scalar
  class << self
    def coerce_input(value, _ctx); end
    def coerce_result(value, ctx); end
  end
end

class GraphQL::UnauthorizedError < ::GraphQL::Error
  def initialize(message = T.unsafe(nil), object: T.unsafe(nil), type: T.unsafe(nil), context: T.unsafe(nil)); end

  def context; end
  def object; end
  def type; end
end

class GraphQL::UnauthorizedFieldError < ::GraphQL::UnauthorizedError
  def initialize(message = T.unsafe(nil), object: T.unsafe(nil), type: T.unsafe(nil), context: T.unsafe(nil), field: T.unsafe(nil)); end

  def field; end
  def field=(_); end
end

class GraphQL::UnionType < ::GraphQL::BaseType
  def initialize; end

  def add_possible_types(types, **options); end
  def get_possible_type(type_name, ctx); end
  def include?(child_type_defn, ctx = T.unsafe(nil)); end
  def kind; end
  def possible_type?(type, ctx); end
  def possible_types(ctx = T.unsafe(nil)); end
  def possible_types=(types); end
  def resolve_type(value, ctx); end
  def resolve_type=(new_resolve_type_proc); end
  def resolve_type_proc; end
  def resolve_type_proc=(_); end
  def type_membership_class; end
  def type_membership_class=(_); end
  def type_memberships; end
  def type_memberships=(type_memberships); end

  private

  def initialize_copy(other); end
  def possible_types_for_context(ctx); end
end

class GraphQL::UnionType::AcceptPossibleTypesDefinition
  class << self
    def call(target, possible_types, options = T.unsafe(nil)); end
  end
end

class GraphQL::UnresolvedTypeError < ::GraphQL::RuntimeTypeError
  def initialize(value, field, parent_type, resolved_type, possible_types); end

  def field; end
  def parent_type; end
  def possible_types; end
  def resolved_type; end
  def value; end
end

GraphQL::VERSION = T.let(T.unsafe(nil), String)

GraphQL::Schema::BuildFromDefinition::Builder::NullResolveType = T.let(T.unsafe(nil), Proc)
