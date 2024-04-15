local ls = require "luasnip"
local extras = require "luasnip.extras"
local s = ls.snippet
local t = ls.text_node -- 文本节点
local i = ls.insert_node -- 插入节点
local fmt = require("luasnip.extras.fmt").fmt
local postfix = require("luasnip.extras.postfix").postfix
local l = extras.lambda
local f = ls.function_node -- 返回字符串

return {
  -- s({ trig = "foo", snippetType = "autosnippet" }, t "this is a autosnippet"),

  s({
    trig = "debug(%d)(%s)",
    regTrig = true,
    snippetType = "autosnippet",
  }, {
    f(function(_args, snip) return 'println!("debug' .. snip.captures[1] .. '");' end, {}),
  }),
  s("derivedebug", t "#[derive(Debug)]"),
  s("deadcode", t "#[allow(dead_code)]"),
  s("allowfreedom", t "#![allow(clippy::disallowed_names, unused_variables, dead_code)]"),

  s("clippypedantic", t "#![warn(clippy::all, clippy::pedantic)]"),

  s(":turbofish", { t { "::<" }, i(0), t { ">" } }),

  s("testcfg", {
    t { "#[cfg(test)]", "" },
    t { "mod " },
    i(1),
    t { " {", "" },
    t { "	#[test]", "" },
    t { "	fn " },
    i(2),
    t { "() {", "" },
    t { "		assert" },
    i(0),
    t { "", "" },
    t { "	}", "" },
    t { "}" },
  }),

  s("sleep", {
    t { "std::thread::sleep(std::time::Duration::from_secs(" },
    i(1),
    t { "));" },
  }),

  -- postfix({ trig = "&", match_pattern = "[%w%.%_%-%(%)%<%>:&*]+%s$", priority = 9999 }, {
  --   f(function(_, parent)
  --     local str = parent.snippet.env.POSTFIX_MATCH .. ""
  --     if string.match(str, "%([%w%.%_%<%>]+$") then
  --       -- foo(bar &) -> foo(&bar) rather than &foo(bar)
  --       local s2 = string.match(str, "[%w%.%_%<%>]+$")
  --       local s1 = string.sub(str, 1, -#s2 - 1)
  --       return s1 .. "&" .. s2
  --     end
  --     return "&" .. parent.snippet.env.POSTFIX_MATCH
  --   end, {}),
  -- }),
  --
  -- postfix({ trig = "*", match_pattern = "[%w%.%_%-%(%)%<%>:&*]+%s$", priority = 9999 }, {
  --   f(function(_, parent)
  --     local str = parent.snippet.env.POSTFIX_MATCH .. ""
  --     if string.match(str, "%([%w%.%_%<%>]+$") then
  --       -- foo(bar *) -> foo(*bar) rather than *foo(bar)
  --       local s2 = string.match(str, "[%w%.%_%<%>]+$")
  --       local s1 = string.sub(str, 1, -#s2 - 1)
  --       return s1 .. "*" .. s2
  --     end
  --     return "*" .. parent.snippet.env.POSTFIX_MATCH
  --   end, {}),
  -- }),

  -- postfix({ trig = "opt", match_pattern = "[%w%.%_%<%>:&*]+%s$", priority = 9999 }, {
  --   f(function(_, parent) return string.sub("Option<" .. parent.snippet.env.POSTFIX_MATCH, 1, -2) .. ">" end, {}),
  -- }),
  -- postfix({ trig = "some", match_pattern = "[%w%.%_%(%):&*]+%s$", priority = 9999 }, {
  --   f(function(_, parent) return string.sub("Some(" .. parent.snippet.env.POSTFIX_MATCH, 1, -2) .. ")" end, {}),
  -- }),
  -- postfix({ trig = "res", match_pattern = "[%w%.%_%<%>:&*]+%s$", priority = 9999 }, {
  --   f(function(_, parent) return string.sub("Result<" .. parent.snippet.env.POSTFIX_MATCH, 1, -2) .. ">" end, {}),
  -- }),
  -- postfix({ trig = "ok", match_pattern = "[%w%.%_%(%):&*]+%s$", priority = 9999 }, {
  --   f(function(_, parent) return string.sub("Ok(" .. parent.snippet.env.POSTFIX_MATCH, 1, -2) .. ")" end, {}),
  -- }),
  -- postfix({ trig = "err", match_pattern = "[%w%.%_%(%):&]+%s$", priority = 9999 }, {
  --   f(function(_, parent) return string.sub("Err()" .. parent.snippet.env.POSTFIX_MATCH, 1, -2) .. ")" end, {}),
  -- }),
}
