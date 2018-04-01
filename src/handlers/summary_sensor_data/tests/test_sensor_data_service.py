from datetime import datetime, timezone, timedelta

import pytest

from sensor_data_service import SensorDataService
from sensor_data_repository import SensorDataRepository


class TestSummaryReport(object):
    @pytest.mark.parametrize(
        'now_time_string', [
            ('2018/02/02 02:10:10')
        ])
    def test_normal(self, now_time_string, monkeypatch):
        def put_data_patched(*args, body_data, current_date):
            pass

        monkeypatch.setattr(
            SensorDataRepository,
            'merged_data', lambda *_: None)
        monkeypatch.setattr(
            SensorDataRepository,
            'put_data', put_data_patched)

        JST = timezone(timedelta(hours=+9), 'JST')
        dt = datetime.strptime(now_time_string, '%Y/%m/%d %H:%M:%S')

        target = datetime.fromtimestamp(
            timestamp=dt.timestamp(), tz=JST)

        SensorDataService().summary_report(target)
