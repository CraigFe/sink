open Import

type ('l, 'r) t = Left of 'l | Right of 'r [@@deriving branded]
