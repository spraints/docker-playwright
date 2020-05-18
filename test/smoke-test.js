const {chromium, firefox, webkit} = require('playwright')

async function main() {
  try {
    await test(webkit, {})
    await test(chromium, {args: ["--no-sandbox"]})
    await test(firefox, {})
  } catch (e) {
    console.log('ERRRROR!', e)
  }
}

async function test(browserType, opts) {
  const browserTypeName = browserType.name()
  let launched = false
  opts.logger = {
    isEnabled: (name, severity) => !launched || severity === 'error',
    log: (name, severity, message, args) => console.log(`[${browserTypeName}] ${name}/${severity} -- ${message}`)
  }
  const browser = await browserType.launch(opts)
  const context = await browser.newContext()
  console.log(`[${browserTypeName}] launched! dropping log level to "error"`)
  launched = true
  const page = await context.newPage()
  await page.goto('https://github.com')
  await browser.close()
  console.log(`[${browserTypeName}] success!`)
}

main()
