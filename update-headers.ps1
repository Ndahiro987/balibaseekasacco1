,$htmlFiles = Get-ChildItem -Filter "*.html" | Where-Object { $_.Name -notmatch "^(admin|index|404|maintenance)" }
$newHeader = '<div class="header-top">
            <div class="container">
                <div class="logo">
                    <div class="logo-icon">
                        <img src="assets/logo.svg" alt="Bali Baseeka Sacco Logo">
                    </div>
                    <div class="logo-text">
                        <h1>Bali Baseeka</h1>
                        <span>Sacco Services</span>
                    </div>
                </div>
                <div class="header-actions">
                    <a href="login.html" class="login-btn">Member Login</a>
                    <a href="admin-login.html" class="admin-btn">Admin Login</a>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">'
$closingDiv = '</div>
        </div>'

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    if ($content -match '<div class="container">\s*<div class="logo">') {
        $content = $content -replace '<div class="container">\s*<div class="logo">', $newHeader
        $content = $content -replace '</div>\s*<div class="hamburger"', "$closingDiv`n<div class=""hamburger"""
        Set-Content $file.FullName -NoNewline -Value $content
        Write-Host "Updated: $($file.Name)"
    }
}
Write-Host "Done!"