type t

val pp : t Fmt.t
val make : ?tls:bool -> Address.t -> Cri_lwt.send -> t
val uid : t -> Uid.t
val address : t -> Address.t
val send : t -> ?prefix:Cri.Protocol.prefix -> 'a Cri.Protocol.t -> 'a -> unit
