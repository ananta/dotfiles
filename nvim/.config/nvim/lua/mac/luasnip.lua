local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

local snip = luasnip.snippet
local node = luasnip.snippet_node
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node
local choice = luasnip.choice_node
local dynamicn = luasnip.dynamic_node

local cpp_template = function()
	return {}
end
luasnip.add_snippets(nil, {
	all = {
		snip({
			trig = "template_cp_simple",
			namr = "Basic Cpp Template",
			dscr = "Basic C++ template by @anntz",
		}, {
			text({
				"#include<bits/stdc++.h>",
				"using namespace std;",
				"",
				"int main(){",
				"",
				"  #ifndef ONLINE_JUDGE",
				'    freopen("input.txt", "r", stdin);',
				'    freopen("output.txt", "r", stdout);',
				"  #endif",
				"",
			}),
			insert(0),
			text({
				"",
				"",
				"  return 1;",
				"}",
			}),
		}),
	},
})
