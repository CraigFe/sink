open Sink_kernel

module type S = sig
  type 'a t

  val unit : unit t
  val char : char t
  val string : string t
  val int : int t
  val int32 : int32 t
  val int64 : int64 t
  val float : float t
  val bool : bool t
  val pair : 'a t -> 'b t -> ('a * 'b) t
  val triple : 'a t -> 'b t -> 'c t -> ('a * 'b * 'c) t
  val either : 'a t -> 'b t -> ('a, 'b) either t
  val list : 'a t -> 'a list t
  val array : 'a t -> 'a array t
  val option : 'a t -> 'a option t
  val result : 'a t -> 'b t -> ('a, 'b) result t
end
