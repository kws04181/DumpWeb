package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Option;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Summary;


import java.util.List;

public interface DailyReportStep2Mapper {
    DailyReportStep2Summary selectCalSummary(DailyReportStep2Option option,String userId);

    List<DailyReportStep2Sub> selectDispatchStatusList(String userId,String today);

}
