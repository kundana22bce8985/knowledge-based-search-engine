class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.searchengine/search"
    private val knowledgeBase = mapOf(
        "flutter" to "Flutter is Google’s toolkit...",
        "kotlin" to "Kotlin is a concise language...",
        "ai" to "Artificial Intelligence...",
        "search engine" to "A search engine..."
    )

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "searchKnowledge") {
                    val query = call.argument<String>("query")?.trim() ?: ""
                    val response = searchKnowledge(query)
                    result.success(response)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun searchKnowledge(query: String): String {
        if (query.isBlank()) return "Please enter a search term."
        val matches = knowledgeBase.filter { (key, _) ->
            key.lowercase().contains(query.lowercase())
        }
        return if (matches.isNotEmpty()) {
            matches.entries.joinToString("\n\n") { (key, value) ->
                "🔹 ${key.replaceFirstChar { it.uppercase() }}: $value"
            }
        } else {
            "No relevant information found for \"$query\"."
        }
    }
}
