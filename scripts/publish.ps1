Param(
  [Parameter(Mandatory=$true)][string]$Title,
  [Parameter(Mandatory=$true)][string]$ContentFile
)
$Slug = ($Title.ToLower() -replace "[^a-z0-9]+","-").Trim("-")
$Date = Get-Date -Format "yyyy-MM-dd"
$Out = "src/content/blog/$Slug.md"

# Gera o arquivo do post com frontmatter + conteúdo
@("---","title: `"$Title`"","description: `"Draft post`"","pubDate: `"$Date`"","tags: [`"note`"]","---","", (Get-Content $ContentFile -Raw)) |
  Set-Content -Encoding UTF8 $Out

Write-Host "Wrote $Out"

git add $Out
git commit -m "post: $Title"
git push
