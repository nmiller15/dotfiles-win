#SingleInstance Force

^Space::
{
    todo := InputBox("", "To Do")
    if todo.Result = "Cancel"
        return

    ; desc := InputBox("", "Description")
    ; if desc.Result = "Cancel"
    ;     return

    RunFormat := Format('py C:\Code\dotfiles\bin\add-to-things "{}"', todo.Value)
    Run(RunFormat)
}
