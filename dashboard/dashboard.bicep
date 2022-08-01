@description('Location for all resources.')
param location string = resourceGroup().location

@description('Resource group name.')
param resourceGroupName string = resourceGroup().name

@description('Subscription id.')
param subscriptionId string = subscription().id

@description('Subscription name.')
param subscriptionName string = subscription().displayName

resource My_Dashboard 'Microsoft.Portal/dashboards@2015-08-01-preview' = {
  name: 'My-Dashboard'
  location: location
  tags: {
    'hidden-title': 'My-Dashboard'
  }
  properties: {
    lenses: {
      '0': {
        order: 0
        parts: {
          '0': {
            position: {
              x: 0
              y: 0
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  value: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            region: location
                            resourceType: 'microsoft.compute/virtualmachines'
                            subscription: {
                              subscriptionId: subscriptionId
                              displayName: subscriptionName
                              uniqueDisplayName: subscriptionName
                            }
                          }
                          name: 'Data Disk Bandwidth Consumed Percentage'
                          aggregationType: 4
                          namespace: 'microsoft.compute/virtualmachines'
                          metricVisualization: {
                            displayName: 'Data Disk IOPS Consumed Percentage'
                            resourceDisplayName: subscriptionName
                          }
                        }
                      ]
                      title: 'Avg Data Disk Bandwidth Consumed Percentage for${subscriptionName}in East US region  by ResourceId where ResourceGroupName = ${resourceGroupName}'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                      }
                      filterCollection: {
                        filters: [
                          {
                            key: 'Microsoft.ResourceGroupName'
                            operator: 0
                            values: [
                              resourceGroupName
                            ]
                          }
                        ]
                      }
                      grouping: {
                        dimension: 'Microsoft.ResourceId'
                      }
                      timespan: {
                        relative: {
                          duration: 86400000
                        }
                        showUTCTime: false
                        grain: 1
                      }
                    }
                  }
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
            }
          }
          '1': {
            position: {
              x: 6
              y: 0
              colSpan: 6
              rowSpan: 4
            }
            metadata: {
              inputs: [
                {
                  name: 'options'
                  value: {
                    chart: {
                      metrics: [
                        {
                          resourceMetadata: {
                            region: location
                            resourceType: 'microsoft.compute/virtualmachines'
                            subscription: {
                              subscriptionId: subscriptionId
                              displayName: subscriptionName
                              uniqueDisplayName: subscriptionName
                            }
                          }
                          name: 'Data Disk Write Bytes/sec'
                          aggregationType: 4
                          namespace: 'microsoft.compute/virtualmachines'
                          metricVisualization: {
                            displayName: 'Data Disk Write Bytes/Sec'
                            resourceDisplayName: subscriptionName
                          }
                        }
                      ]
                      title: 'Avg Data Disk Write Bytes/Sec for${subscriptionName}in${location}region  by ResourceId where ResourceGroupName = ${resourceGroupName}'
                      titleKind: 1
                      visualization: {
                        chartType: 2
                        legendVisualization: {
                          isVisible: true
                          position: 2
                          hideSubtitle: false
                        }
                        axisVisualization: {
                          x: {
                            isVisible: true
                            axisType: 2
                          }
                          y: {
                            isVisible: true
                            axisType: 1
                          }
                        }
                      }
                      filterCollection: {
                        filters: [
                          {
                            key: 'Microsoft.ResourceGroupName'
                            operator: 0
                            values: [
                              resourceGroupName
                            ]
                          }
                        ]
                      }
                      grouping: {
                        dimension: 'Microsoft.ResourceId'
                      }
                      timespan: {
                        relative: {
                          duration: 86400000
                        }
                        showUTCTime: false
                        grain: 1
                      }
                    }
                  }
                  isOptional: true
                }
                {
                  name: 'sharedTimeRange'
                  isOptional: true
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
            }
          }
        }
      }
    }
    metadata: {
      model: {
        timeRange: {
          value: {
            relative: {
              duration: 24
              timeUnit: 1
            }
          }
          type: 'MsPortalFx.Composition.Configuration.ValueTypes.TimeRange'
        }
        filterLocale: {
          value: 'en-us'
        }
        filters: {
          value: {
            MsPortalFx_TimeRange: {
              model: {
                format: 'utc'
                granularity: 'auto'
                relative: '24h'
              }
              displayCache: {
                name: 'UTC Time'
                value: 'Past 24 hours'
              }
              filteredPartIds: []
            }
          }
        }
      }
    }
  }
}
