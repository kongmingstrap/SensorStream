from datetime import datetime, timezone, timedelta

from sensor_data_service import SensorDataService


def handler(event, context):
    JST = timezone(timedelta(hours=+9), 'JST')
    current_date = datetime.now(tz=JST)

    SensorDataService().summary_report(current_date)
