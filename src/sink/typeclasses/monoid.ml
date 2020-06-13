module type S = sig
  type t

  val empty : t

  val append : t -> t -> t
end
[@@deriving typeclass]
