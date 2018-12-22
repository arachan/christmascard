$cards=(Get-ChildItem cards\*.fodg)

foreach($card in $cards){

    Start-Process $card -Verb Print | Stop-Process

}