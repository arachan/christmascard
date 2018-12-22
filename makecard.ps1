# load data
$data=Import-Csv -Path .\addresslist.csv -Encoding UTF8

foreach($d in $data){
    # load template
    $temp=Get-Content .\card.fodg -Encoding UTF8

    # merge template
    $temp=$temp -replace '{postcode}',$d.postcode
    $temp=$temp -replace '{address1}',$d.address1
    $temp=$temp -replace '{address2}',$d.address2
    $temp=$temp -replace '{name}',$d.name

    $file="cards\"+$d.name

    # output newfile
    $temp | out-file -FilePath $file'.fodg' -Encoding utf8
}