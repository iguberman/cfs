-module( cfs ).
-author( "Jörgen Brandt <brandjoe@hu-berlin.de>" ).

-behaviour( gen_server ).

%% ============================================================
%% Includes
%% ============================================================

-include( "cfs.hrl" ).

%% ============================================================
%% API Exports
%% ============================================================

-export( to/1, from/1, stage/2, and_apply/4 ).

%% ============================================================
%% Generic Server Exports
%% ============================================================

-export( [] ).



%% ============================================================
%% API Functions
%% ============================================================

to( LocalDir )
when is_list( LocalDir ) ->
  {to_local, LocalDir, []}.

from( LocalDir )
when is_list( LocalDir ) ->
  {from_local, LocalDir, []}.

stage( {Direction, LocalDir, NameList}, Name )
when is_atom( Direction ),
     is_list( LocalDir ),
     is_list( NameList ),
     is_list( Name ) ->
  {Direction, LocalDir, [Name|NameList]}.

and_apply( {Direction, LocalDir, NameList}, Module, Function, Args ) ->
when is_atom( Direction ),
     is_list( LocalDir ),
     is_list( NameList ),
     is_atom( Module ),
     is_atom( Function ),
     is_list( Args ) ->
  gen_server:call( cfs, {Direction, LocalDir, NameList, Module, Function, Args} ).
       

%% ============================================================
%% Generic Server Functions
%% ============================================================

