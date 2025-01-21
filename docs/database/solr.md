---
outline: deep
---

## insert to solr

```java
public static void insertDocument(String id, String content, int url_ms) {
    try (SolrClient solrClient = new HttpSolrClient.Builder(SOLR_URL).build()) {
        // First check if document exists
        if (!documentExists(solrClient, id)) {
            // Create new document
            SolrInputDocument document = new SolrInputDocument();
            document.addField("id", id);
            document.addField("clean_text", content);
            document.addField("url_ms", url_ms);

            // Add document to Solr
            solrClient.add(document);
            solrClient.commit();
            System.out.println("Document added successfully");
        } else {
            System.out.println("Document with ID " + id + " already exists");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
```

## Check if document exists

```java
private static boolean documentExists(SolrClient solrClient, String id) 
        throws SolrServerException, IOException {
    SolrQuery query = new SolrQuery();
    query.setQuery("id:" + id);
    QueryResponse response = solrClient.query(query);
    SolrDocumentList results = response.getResults();
    return results.getNumFound() > 0;
}
```

## Looping and add to json

```java
SolrDocumentList documents = response.getResults();

List<String> data = new ArrayList<>();
documents.forEach(doc -> {
    JSONObject existingJsonString = new JSONObject();
    doc.getFieldNames()
            .forEach(fieldName -> existingJsonString.put(fieldName, doc.getFieldValue(fieldName)));
    data.add(existingJsonString.toString());
});
System.out.println(data);
```

## Modify json  

```java
SolrDocumentList documents = response.getResults();

List<String> data = new ArrayList<>();
documents.forEach(doc -> {
    JSONObject existingJsonString = new JSONObject();
    doc.getFieldNames()
            .forEach(fieldName -> existingJsonString.put(fieldName, doc.getFieldValue(fieldName)));
    ObjectMapper mapper = new ObjectMapper();

    try {
        ObjectNode existingNode = (ObjectNode) mapper.readTree(existingJsonString.toString());
        existingNode.put("is_exists", documents.getNumFound() > 0);
        data.add(existingNode.toString());
    } catch (JsonMappingException e) {
        System.out.println(e.getMessage());
    } catch (JsonProcessingException e) {
        System.out.println(e.getMessage());
    }

});
System.out.println(data);
```
