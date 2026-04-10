t$htmlFiles = Get-ChildItem -Filter "*.html" | Where-Object { $_.Name -notmatch "^admin" }
$oldHeader = '<div class="header-top">
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
$newHeader = '<div class="header">
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
            <nav class="nav">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="services.html">Services</a></li>
                    <li><a href="membership.html">Join Us</a></li>
                    <li><a href="faq.html">FAQs</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </nav>
            <div class="header-actions">
                <a href="login.html" class="login-btn">Member Login</a>
                <a href="admin-login.html" class="admin-btn">Admin Login</a>
            </div>
            <div class="hamburger" id="hamburger" onclick="toggleMenu()">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </div>'
$oldEnd = '</div>
        </div>
    </header>'
$newEnd = '</header>'

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    if ($content -match 'class="header-top"') {
        $content = $content -replace [regex]::Escape($oldHeader), $newHeader
        $content = $content -replace [regex]::Escape($oldEnd), $newEnd
        Set-Content $file.FullName -NoNewline -Value $content
        Write-Host "Updated: $($file.Name)"
    }
}
Write-Host "Done!"