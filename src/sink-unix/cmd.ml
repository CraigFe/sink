let rec mkdir_p path =
  try Unix.mkdir path 0o777 with
  | Unix.Unix_error (EEXIST, _, _) -> ()
  | Unix.Unix_error (ENOENT, _, _) ->
      let parent = Filename.dirname path in
      mkdir_p parent;
      Unix.mkdir path 0o777

let print_to_file path printer =
  let channel = open_out path in
  let formatter = Format.formatter_of_out_channel channel in
  printer formatter;
  Format.pp_print_newline formatter ();
  close_out channel

let sequence_commands cmds =
  List.fold_left
    (fun ret cmd ->
      match ret with
      | Error e -> Error e
      | Ok () -> (
          match Unix.system cmd with
          | WEXITED 0 -> Ok ()
          | WEXITED n ->
              Result.errorf "Command \"%s\" failed with return code %d" cmd n
          | WSIGNALED _ | WSTOPPED _ ->
              Result.errorf "Command \"%s\" was interrupted" cmd ))
    (Ok ()) cmds
