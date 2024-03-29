%% ============================================================
%% Type Definitions
%% ============================================================

-type direction() :: to_local | from_local.
-type job()       :: {direction(), string(), [string()]}.

%% ============================================================
%% Function Specifications
%% ============================================================

-spec to( LocalDir ) -> Job
when LocalDir :: string(),
     Job      :: job().


-spec from( LocalDir ) -> Job
when LocalDir :: string(),
     Job      :: job().
				   

-spec stage( Job, Name ) -> NewJob
when Job    :: job(),
     Name   :: string(),						   
     NewJob :: job().


-spec commence( Job, Precond ) -> ok
when Job     :: job(),						  
     Precond :: reference().
