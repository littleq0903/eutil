-module(eutil).
-compile(export_all).

%% -- Random modules --
choice(List) -> 
    lists:nth(crypto:rand_uniform(1, length(List) + 1), List).

shuffle([]) ->
    [];
shuffle(List) ->
    Random_one = lists:nth(crypto:rand_uniform(1, length(List)+1), List),
    lists:append([Random_one], shuffle(lists:delete(Random_one, List))).

