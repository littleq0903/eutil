-module(eutil).
-compile(export_all).

%% -- Random modules --

%% choice(List) -> Randomly chose one element.
choice(List) -> 
    lists:nth(crypto:rand_uniform(1, length(List) + 1), List).

%% shuffle(List) -> Shuffled List.
shuffle([]) ->
    [];
shuffle(List) ->
    Random_one = lists:nth(crypto:rand_uniform(1, length(List)+1), List),
    lists:append([Random_one], shuffle(lists:delete(Random_one, List))).


%% -- Lists modules --

%% Pythonic Lists slicing
slice(s, 0, List) ->
    List;
slice(s, StartIndex, List) when StartIndex < length(List) -> 
    lists:nthtail(StartIndex, List);
slice(e, 0, List) ->
    List;
slice(e, EndIndex, List) when EndIndex =< length(List) ->
    lists:reverse(lists:nthtail(length(List)-EndIndex, lists:reverse(List)));
slice(StartIndex, EndIndex, List) ->
    slice(s, StartIndex, slice(e, EndIndex, List)).





