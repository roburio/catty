type t =
  | New_message of Uid.t * Message.t
  | New_window of Uid.t * string
  | Delete_window of Uid.t
  | Set_status of Status.t

let set_status status = Set_status status
let new_message ~uid msg = New_message (uid, msg)
let new_window ~uid name = New_window (uid, name)
let delete_window ~uid = Delete_window uid

let pp ppf = function
  | New_message (uid, msg) ->
      Fmt.pf ppf "new-message(%a): %a" Uid.pp uid Message.pp msg
  | New_window (uid, name) -> Fmt.pf ppf "new-window(%a): %s" Uid.pp uid name
  | Delete_window uid -> Fmt.pf ppf "delete-window(%a)" Uid.pp uid
  | Set_status status -> Fmt.pf ppf "status:%a" Status.pp status
