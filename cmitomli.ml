let version = "1.0.0"

let cmi_to_mli infile =
  let x = Cmi_format.read_cmi infile in
  let l = x.Cmi_format.cmi_sign in
  Printtyp.signature Format.std_formatter l;
  Format.print_flush ();
  print_newline ();
  flush stdout

let usage () =
  Printf.eprintf "\
cmitomli %s for ocaml %s
Usage: cmitomli <file.cmi>\n%!"
    version Sys.ocaml_version

let main () =
  match Sys.argv with
      [| _; ("-help" | "--help" | "-h") |] -> usage (); exit 0
    | [| _; x |] -> cmi_to_mli x
    | _ -> usage (); exit 1

let () = main ()
