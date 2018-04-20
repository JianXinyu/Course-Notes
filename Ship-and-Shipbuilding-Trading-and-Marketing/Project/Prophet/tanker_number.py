# -*- coding: utf-8 -*-
"""
Created on Mon Dec 18 22:47:09 2017

@author: jianx
"""

import pandas as pd
import numpy as np
from fbprophet import Prophet

tanker_number = pd.read_csv('tanker_number.csv')
tanker_number['y'] = np.log(tanker_number['y'])
tanker_number.head()

# 将数据框导入Prophet模型
m = Prophet()
m.fit(tanker_number);

# 预测，将结果放入forecast数据框
future = m.make_future_dataframe(periods=1095)
forecast = m.predict(future)
forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail()

# 按forecast数据框绘图
m.plot(forecast,xlabel='date',ylabel='tanker_number');
m.plot_components(forecast);