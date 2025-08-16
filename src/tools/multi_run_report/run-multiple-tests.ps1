# PowerShell script para correr multiples veces la pruebat y generar un reporte
# se genera debido a que previamente habia momentos en los que los test fallaban 1 de cada 20 veces.
# Location: src/tools/multi_run_report/run-multiple-tests.ps1
# comando: npm run test-100

param(
    [int]$Iterations = 100,
    [string]$OutputFile = "test-results.json"
)

# Initialize counters and results array
$passed = 0
$failed = 0
$results = @()
$startTime = Get-Date

Write-Host "Starting $Iterations test runs..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

for ($i = 1; $i -le $Iterations; $i++) {
    Write-Host "`nRunning test iteration $i/$Iterations" -ForegroundColor Yellow
    
    $iterationStartTime = Get-Date
    $iterationResult = @{
        iteration = $i
        startTime = $iterationStartTime.ToString("yyyy-MM-dd HH:mm:ss")
        status = ""
        duration = 0
        exitCode = 0
    }
    
    try {
        # Run the test command and capture output
        $output = npm run test 2>&1
        $exitCode = $LASTEXITCODE
        
        $iterationEndTime = Get-Date
        $duration = ($iterationEndTime - $iterationStartTime).TotalSeconds
        
        $iterationResult.duration = $duration
        $iterationResult.exitCode = $exitCode
        
        if ($exitCode -eq 0) {
            Write-Host "Iteration $i PASSED ($($duration.ToString("F2"))s)" -ForegroundColor Green
            $iterationResult.status = "PASSED"
            $passed++
        } else {
            Write-Host "Iteration $i FAILED ($($duration.ToString("F2"))s)" -ForegroundColor Red
            $iterationResult.status = "FAILED"
            $iterationResult.output = $output | Out-String
            $failed++
        }
    } catch {
        $iterationEndTime = Get-Date
        $duration = ($iterationEndTime - $iterationStartTime).TotalSeconds
        
        Write-Host "Iteration $i FAILED with exception ($($duration.ToString("F2"))s)" -ForegroundColor Red
        $iterationResult.status = "FAILED_EXCEPTION"
        $iterationResult.duration = $duration
        $iterationResult.error = $_.Exception.Message
        $failed++
    }
    
    $results += $iterationResult
}

$endTime = Get-Date
$totalDuration = ($endTime - $startTime).TotalSeconds
$averageDuration = $totalDuration / $Iterations
$successRate = if ($Iterations -gt 0) { [math]::Round(($passed / $Iterations) * 100, 2) } else { 0 }

# Display summary
Write-Host "`nTest Run Summary:" -ForegroundColor Cyan
Write-Host "========================" -ForegroundColor Cyan
Write-Host "Total Runs: $Iterations" -ForegroundColor Cyan
Write-Host "Passed: $passed" -ForegroundColor Green
Write-Host "Failed: $failed" -ForegroundColor Red
Write-Host "Success Rate: $successRate%" -ForegroundColor Cyan
Write-Host "Total Time: $($totalDuration.ToString("F2"))s" -ForegroundColor Cyan
Write-Host "Average Time per Run: $($averageDuration.ToString("F2"))s" -ForegroundColor Cyan

# Create detailed results object
$summary = @{
    timestamp = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
    totalRuns = $Iterations
    passed = $passed
    failed = $failed
    successRate = $successRate
    totalTime = $totalDuration
    averageTimePerRun = $averageDuration
    iterations = $results
}

# Save results to file
$summary | ConvertTo-Json -Depth 10 | Out-File -FilePath $OutputFile
Write-Host "`nDetailed results saved to $OutputFile" -ForegroundColor Magenta

# Also save a simple summary
$summaryText = @"
Test Run Summary
================
Total Runs: $Iterations
Passed: $passed
Failed: $failed
Success Rate: $successRate%
Total Time: $($totalDuration.ToString("F2"))s
Average Time per Run: $($averageDuration.ToString("F2"))s
"@

$summaryText | Out-File -FilePath "test-summary.txt"
Write-Host "Simple summary saved to test-summary.txt" -ForegroundColor Magenta

# Exit with code based on success rate
if ($passed -eq $Iterations) {
    Write-Host "`nAll tests passed!" -ForegroundColor Green
    exit 0
} else {
    Write-Host "`nSome tests failed." -ForegroundColor Yellow
    exit 1
}