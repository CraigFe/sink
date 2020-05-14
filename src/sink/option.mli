open Import

type 'a t = 'a option

val none : 'a t

val some : 'a -> 'a t
(** See also {!pure}. *)

val get : 'a t -> 'a
(** Get the value [v] from a [Some v].

    @raise [Invalid_argument] if the argument is ([None]). *)

val to_result : none:'b -> 'a t -> ('a, 'b) Result.t

val to_list : 'a t -> 'a List.t

val to_seq : 'a t -> 'a Seq.t

include Eq.S2 with type 'a t := 'a t
(** @closed *)

include Ord.S2 with type 'a t := 'a t
(** @closed *)

include Functor.S with type 'a t := 'a t
(** @closed *)

include Applicative.S with type 'a t := 'a t
(** @closed *)

include Monad.S with type 'a t := 'a t
(** @closed *)
