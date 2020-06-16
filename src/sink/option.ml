open Import
module O = Stdlib.Option

type 'a t = 'a option [@@deriving branded]

let none = None

let some v = Some v

(* let value o ~default = match o with Some v -> v | None -> default *)

let get = function Some v -> v | None -> invalid_arg "get: option is None"

let bind o f = match o with None -> None | Some v -> f v

let join = function Some o -> o | None -> None

let map f o = match o with None -> None | Some v -> Some (f v)

(* let fold ~none ~some = function Some v -> some v | None -> none *)

(* let iter f = function Some v -> f v | None -> () *)

let equal eq o0 o1 =
  match (o0, o1) with
  | Some v0, Some v1 -> eq v0 v1
  | None, None -> true
  | _ -> false

let compare cmp o0 o1 =
  match (o0, o1) with
  | Some v0, Some v1 -> cmp v0 v1
  | None, None -> Ordering.Eq
  | None, Some _ -> Lt
  | Some _, None -> Gt

let to_result ~none = function None -> Error none | Some v -> Ok v

let to_list = function None -> [] | Some v -> [ v ]

let to_seq = function None -> Seq.empty | Some v -> Seq.return v

let kliesli _ = failwith "TODO"

let seq _ = failwith "TODO"

let return _ = failwith "TODO"

let lift2 _ = failwith "TODO"

let apply _ = failwith "TODO"

let pure _ = failwith "TODO"

let min _ = failwith "TODO"

let max _ = failwith "TODO"
