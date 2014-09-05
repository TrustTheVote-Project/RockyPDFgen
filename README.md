RockyPDFgen
===========
A standalone stateless headless web service that provides a RESTful API for other Rocky components to submit a request to generate a PDF file based on data in an input JSON blob. The requests are queued, and the queue managed to support tuning to a particular VM configuration that ensures that the service remains responsive under high load, even if the result is a growing backlog in the queue. The resulting PDFs are stored on a shared file server accessible via a URL that is created by this service.
