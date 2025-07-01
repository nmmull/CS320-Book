(* testing *)

type symbol =
  | Terminal of string
  | Nonterminal of string

type sent_form = symbol list
type rule = string * sent_form
type grammar = rule list

module S = Set.Make(String)

let terminals : grammar ->  S.t =
  let terminals : sent_form -> S.t =
    let rec go s = function
      | [] -> s
      | Terminal id :: l -> go (S.add id s) l
      | _ :: l -> go s l
    in go S.empty
  in
  let rec go s = function
    | [] -> s
    | (_ , sf) :: l -> go (S.union (terminals sf) s) l
  in go S.empty

let nonterminals : grammar -> S.t =
  let nonterminals : sent_form -> S.t =
    let rec go s = function
      | [] -> s
      | Nonterminal id :: l -> go (S.add id s) l
      | _ :: l -> go s l
    in go S.empty
  in
  let rec go s = function
    | [] -> s
    | (id, sf) :: l -> go (s |> S.add id |> S.union (nonterminals sf)) l
  in go S.empty

let start : grammar -> string option = function
  | (id, _) :: _ -> Some id
  |

