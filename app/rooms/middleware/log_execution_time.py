import time
import logging

logger = logging.getLogger(__name__)


class ExecutionTimeLogMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        start_time = time.time()
        response = self.get_response(request)
        end_time = time.time()
        time_diff = end_time - start_time
        logger.info(msg=str(";" + request.get_full_path()) +
                    ";" + str(time_diff))
        return response
