#SingleInstance Force

^Space::
{
    todo := InputBox("", "To Do")
    if todo.Result = "Cancel"
        return

    desc := InputBox("", "Description")
    if desc.Result = "Cancel"
        return

    RunFormat := Format('python3 add-to-things "{}" --desc "{}"', todo.Value, desc.Value)
    Run(RunFormat)
}
