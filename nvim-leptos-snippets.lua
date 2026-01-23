local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node

local function header()
  return t { 'use leptos::prelude::*;', '', '' }
end

ls.add_snippets('rust', {
  -- Component
  s({ trig = 'lcomponent', name = 'Component', dscr = 'Leptos Component' }, {
    header(),
    t '#[component]',
    t { '', 'pub fn ' },
    i(1, 'ComponentName'),
    t '() -> impl IntoView {',
    t { '', '    view! {' },
    t { '', '        ' },
    i(0),
    t { '', '    }' },
    t { '', '}' },
  }),

  -- Component with props
  s({ trig = 'lcompprops', name = 'Component with Props', dscr = 'Leptos Component with properties' }, {
    header(),
    t '#[component]',
    t { '', 'pub fn ' },
    i(1, 'ComponentName'),
    t '(',
    t { '', '    prop: ReadSignal<' },
    i(2, 'i32'),
    t '>',
    t { '', ') -> impl IntoView {' },
    t { '', '    view! {' },
    t { '', '        ' },
    i(0),
    t { '', '    }' },
    t { '', '}' },
  }),

  -- Default props
  s({ trig = 'ldefaultprop', name = 'Prop default value', dscr = 'Setting default value to a prop' }, {
    t '#[prop(default = ',
    i(1, 'value'),
    t ')]',
  }),

  -- Signal
  s({ trig = 'lsignal', name = 'Signal', dscr = 'Create a signal' }, {
    t 'let (',
    i(1, 'value'),
    t ', set_',
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t ') = signal(',
    i(2, '0'),
    t ');',
    i(0),
  }),

  -- RwSignal
  s({ trig = 'lrwsignal', name = 'RwSignal', dscr = 'Create a read-write signal' }, {
    t 'let ',
    i(1, 'value'),
    t ' = RwSignal::new(',
    i(2, '0'),
    t ');',
    i(0),
  }),

  -- Resource
  s({ trig = 'lresource', name = 'Resource', dscr = 'Create a resource for async data loading' }, {
    t 'let ',
    i(1, 'data'),
    t ' = Resource::new(',
    t { '', '    move || ' },
    i(2, 'trigger.get()'),
    t ',',
    t { '', '    |' },
    i(3, 'value'),
    t '| ',
    i(4, 'fetch_data(value)'),
    t { '', ');' },
    i(0),
  }),

  -- LocalResource
  s({ trig = 'llocalresource', name = 'LocalResource', dscr = 'Create a local resource (client-only)' }, {
    t 'let ',
    i(1, 'data'),
    t ' = LocalResource::new(move || ',
    i(2, 'fetch_data()'),
    t ');',
    i(0),
  }),

  -- Server function
  s({ trig = 'lserver', name = 'Server Function', dscr = 'Create a server function' }, {
    header(),
    t '#[server]',
    t { '', 'pub async fn ' },
    i(1, 'function_name'),
    t '(',
    i(2, ''),
    t ') -> Result<',
    i(3, 'String'),
    t ', ServerFnError> {',
    t { '', '    ' },
    i(0),
    t { '', '}' },
  }),

  -- Action
  s({ trig = 'laction', name = 'Action', dscr = 'Create an action for mutations' }, {
    t 'let ',
    i(1, 'action'),
    t ' = Action::new(|',
    i(2, 'input'),
    t ': &',
    i(3, 'String'),
    t '| async move {',
    t { '', '    ' },
    i(0),
    t { '', '});' },
  }),

  -- For loop
  s({ trig = 'lfor', name = 'For Loop', dscr = 'Efficient keyed list rendering' }, {
    t '<For',
    t { '', '    each=move || ' },
    i(1, 'items.get()'),
    t { '', '    key=|' },
    i(2, 'item'),
    t '| ',
    i(3, 'item.id'),
    t { '', '    children=move |' },
    f(function(args)
      return args[1][1]
    end, { 2 }),
    t '| view! {',
    t { '', '        ' },
    i(0),
    t { '', '    }' },
    t { '', '/>' },
  }),

  -- Show component
  s({ trig = 'lshow', name = 'Show', dscr = 'Conditional rendering with Show' }, {
    t '<Show',
    t { '', '    when=move || ' },
    i(1, 'condition.get()'),
    t { '', '    fallback=|| view! { ' },
    i(2, ''),
    t ' }',
    t { '', '>' },
    t { '', '    ' },
    i(0),
    t { '', '</Show>' },
  }),

  -- Suspense
  s({ trig = 'lsuspense', name = 'Suspense', dscr = 'Suspense boundary for async loading' }, {
    t '<Suspense fallback=|| view! { ',
    i(1, '<p>"Loading..."</p>'),
    t ' }>',
    t { '', '    ' },
    i(0),
    t { '', '</Suspense>' },
  }),

  -- Effect
  s({ trig = 'leffect', name = 'Effect', dscr = 'Create an effect' }, {
    t 'Effect::new(move |_| {',
    t { '', '    ' },
    i(0),
    t { '', '});' },
  }),

  -- Memo
  s({ trig = 'lmemo', name = 'Memo', dscr = 'Create a memoized derived signal' }, {
    t 'let ',
    i(1, 'derived'),
    t ' = Memo::new(move |_| ',
    i(2, 'value.get() * 2'),
    t ');',
    i(0),
  }),

  -- Event handler
  s({ trig = 'lonclick', name = 'OnClick', dscr = 'onClick event handler' }, {
    t 'on:click=move |_| {',
    t { '', '    ' },
    i(0),
    t { '', '}' },
  }),

  -- Context provider
  s({ trig = 'lprovide', name = 'Provide Context', dscr = 'Provide context to child components' }, {
    t 'provide_context(',
    i(1, 'value'),
    t ');',
    i(0),
  }),

  -- Context consumer
  s({ trig = 'luse', name = 'Use Context', dscr = 'Use context from parent' }, {
    t 'let ',
    i(1, 'value'),
    t ' = use_context::<',
    i(2, 'Type'),
    t '>().expect("',
    i(3, 'context not found'),
    t '");',
    i(0),
  }),

  -- NodeRef
  s({ trig = 'lnoderef', name = 'NodeRef', dscr = 'Create a node reference' }, {
    t 'let ',
    i(1, 'node_ref'),
    t ' = NodeRef::<',
    i(2, 'html::Div'),
    t '>::new();',
    i(0),
  }),

  -- Lazy component (for code splitting)
  s({ trig = 'llazy', name = 'Lazy Component', dscr = 'Lazy-loaded component for code splitting' }, {
    header(),
    t '#[lazy]',
    t { '', '#[component]' },
    t { '', 'pub fn ' },
    i(1, 'LazyComponent'),
    t '() -> impl IntoView {',
    t { '', '    view! {' },
    t { '', '        ' },
    i(0),
    t { '', '    }' },
    t { '', '}' },
  }),
})
