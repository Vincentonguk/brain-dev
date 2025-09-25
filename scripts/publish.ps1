Param(
  [Parameter(Mandatory=$true)][string]$Title,
  [Parameter(Mandatory=$true)][string]$ContentFile,
  [string]$Date = (Get-Date -Format 'yyyy-MM-dd'),
  [string]$Description = 'Draft post',
  [string[]]$Tags = @('note')
)
$Slug = ($Title.ToLower() -replace '[^a-z0-9]+','-').Trim('-')
$Out = "src/content/blog/$Slug.md"
$TagsYaml = ($Tags | ForEach-Object { '""' + $_ + '""' }) -join ', '

@("---",
  "title: "$Title"",
  "description: "$Description"",
  "pubDate: "$Date"",
  "tags: [$TagsYaml]",
  "---","",
  (Get-Content $ContentFile -Raw)
) | Set-Content -Encoding UTF8 $Out

git add $Out; git commit -m "post: $Title"; git push
