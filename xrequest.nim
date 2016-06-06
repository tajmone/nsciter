## #
## #  The Sciter Engine of Terra Informatica Software, Inc.
## #  http://sciter.com
## # 
## #  The code and information provided "as-is" without
## #  warranty of any kind, either expressed or implied.
## # 
## #  (C) Terra Informatica Software, Inc.
## # 
## #
## #  Sciter's get resource request object - represents requests made by Element/View.request() functions.
## #  
## # 

import xtypes
type
  HREQUEST* = object
type
  REQUEST_RESULT* = enum
    REQUEST_PANIC = - 1,         ## # e.g. not enough memory
    REQUEST_OK = 0, REQUEST_BAD_PARAM = 1, ## # bad parameter
    REQUEST_FAILURE = 2,        ## # operation failed, e.g. index out of bounds
    REQUEST_NOTSUPPORTED = 3


type
  REQUEST_RQ_TYPE* = enum
    RRT_GET = 1, RRT_POST = 2, RRT_PUT = 3, RRT_DELETE = 4, RRT_FORCE_DWORD = 0xFFFFFFFF


type
  SciterResourceType* = enum
    RT_DATA_HTML = 0, RT_DATA_IMAGE = 1, RT_DATA_STYLE = 2, RT_DATA_CURSOR = 3,
    RT_DATA_SCRIPT = 4, RT_DATA_RAW = 5, RT_DATA_FONT, RT_DATA_SOUND, ## # wav bytes
    RT_DATA_FORCE_DWORD = 0xFFFFFFFF


type
  REQUEST_STATE* = enum
    RS_PENDING = 0, RS_SUCCESS = 1, ## # completed successfully
    RS_FAILURE = 2,             ## # completed with failure
    RS_FORCE_DWORD = 0xFFFFFFFF


type
  SciterRequestAPI* = object
    RequestUse*: proc (rq: HREQUEST): REQUEST_RESULT ## # a.k.a AddRef()
    ## # a.k.a Release()
    RequestUnUse*: proc (rq: HREQUEST): REQUEST_RESULT ## # get requested URL
    RequestUrl*: proc (rq: HREQUEST; rcv: ptr LPCSTR_RECEIVER; rcv_param: pointer): REQUEST_RESULT ## 
                                                                                         ## # 
                                                                                         ## get 
                                                                                         ## real, 
                                                                                         ## content 
                                                                                         ## URL 
                                                                                         ## (after 
                                                                                         ## possible 
                                                                                         ## redirection)
    RequestContentUrl*: proc (rq: HREQUEST; rcv: ptr LPCSTR_RECEIVER;
                            rcv_param: pointer): REQUEST_RESULT ## # get requested data type
    RequestGetRequestType*: proc (rq: HREQUEST; pType: ptr REQUEST_RQ_TYPE): REQUEST_RESULT ## 
                                                                                    ## # 
                                                                                    ## get 
                                                                                    ## requested 
                                                                                    ## data 
                                                                                    ## type
    RequestGetRequestedDataType*: proc (rq: HREQUEST; pData: ptr SciterResourceType): REQUEST_RESULT ## 
                                                                                             ## # 
                                                                                             ## get 
                                                                                             ## received 
                                                                                             ## data 
                                                                                             ## type, 
                                                                                             ## string, 
                                                                                             ## mime 
                                                                                             ## type
    RequestGetReceivedDataType*: proc (rq: HREQUEST; rcv: ptr LPCSTR_RECEIVER;
                                     rcv_param: pointer): REQUEST_RESULT ## # get number of request parameters passed
    RequestGetNumberOfParameters*: proc (rq: HREQUEST; pNumber: ptr cuint): REQUEST_RESULT ## 
                                                                                   ## # 
                                                                                   ## get 
                                                                                   ## nth 
                                                                                   ## request 
                                                                                   ## parameter 
                                                                                   ## name
    RequestGetNthParameterName*: proc (rq: HREQUEST; n: cuint;
                                     rcv: ptr LPCWSTR_RECEIVER; rcv_param: pointer): REQUEST_RESULT ## 
                                                                                              ## # 
                                                                                              ## get 
                                                                                              ## nth 
                                                                                              ## request 
                                                                                              ## parameter 
                                                                                              ## value
    RequestGetNthParameterValue*: proc (rq: HREQUEST; n: cuint;
                                      rcv: ptr LPCWSTR_RECEIVER; rcv_param: pointer): REQUEST_RESULT ## 
                                                                                               ## # 
                                                                                               ## get 
                                                                                               ## request 
                                                                                               ## times 
                                                                                               ## , 
                                                                                               ## ended 
                                                                                               ## - 
                                                                                               ## started 
                                                                                               ## = 
                                                                                               ## milliseconds 
                                                                                               ## to 
                                                                                               ## get 
                                                                                               ## the 
                                                                                               ## requst
    RequestGetTimes*: proc (rq: HREQUEST; pStarted: ptr cuint; pEnded: ptr cuint): REQUEST_RESULT ## 
                                                                                       ## # 
                                                                                       ## get 
                                                                                       ## number 
                                                                                       ## of 
                                                                                       ## request 
                                                                                       ## headers
    RequestGetNumberOfRqHeaders*: proc (rq: HREQUEST; pNumber: ptr cuint): REQUEST_RESULT ## 
                                                                                  ## # 
                                                                                  ## get 
                                                                                  ## nth 
                                                                                  ## request 
                                                                                  ## header 
                                                                                  ## name 
    RequestGetNthRqHeaderName*: proc (rq: HREQUEST; n: cuint;
                                    rcv: ptr LPCWSTR_RECEIVER; rcv_param: pointer): REQUEST_RESULT ## 
                                                                                             ## # 
                                                                                             ## get 
                                                                                             ## nth 
                                                                                             ## request 
                                                                                             ## header 
                                                                                             ## value 
    RequestGetNthRqHeaderValue*: proc (rq: HREQUEST; n: cuint;
                                     rcv: ptr LPCWSTR_RECEIVER; rcv_param: pointer): REQUEST_RESULT ## 
                                                                                              ## # 
                                                                                              ## get 
                                                                                              ## number 
                                                                                              ## of 
                                                                                              ## response 
                                                                                              ## headers
    RequestGetNumberOfRspHeaders*: proc (rq: HREQUEST; pNumber: ptr cuint): REQUEST_RESULT ## 
                                                                                   ## # 
                                                                                   ## get 
                                                                                   ## nth 
                                                                                   ## response 
                                                                                   ## header 
                                                                                   ## name 
    RequestGetNthRspHeaderName*: proc (rq: HREQUEST; n: cuint;
                                     rcv: ptr LPCWSTR_RECEIVER; rcv_param: pointer): REQUEST_RESULT ## 
                                                                                              ## # 
                                                                                              ## get 
                                                                                              ## nth 
                                                                                              ## response 
                                                                                              ## header 
                                                                                              ## value 
    RequestGetNthRspHeaderValue*: proc (rq: HREQUEST; n: cuint;
                                      rcv: ptr LPCWSTR_RECEIVER; rcv_param: pointer): REQUEST_RESULT ## 
                                                                                               ## # 
                                                                                               ## get 
                                                                                               ## completion 
                                                                                               ## status 
                                                                                               ## (CompletionStatus 
                                                                                               ## - 
                                                                                               ## http 
                                                                                               ## response 
                                                                                               ## code 
                                                                                               ## : 
                                                                                               ## 200, 
                                                                                               ## 404, 
                                                                                               ## etc.)
    RequestGetCompletionStatus*: proc (rq: HREQUEST; pState: ptr REQUEST_STATE;
                                     pCompletionStatus: ptr cuint): REQUEST_RESULT ## # 
                                                                               ## get 
                                                                               ## proxy 
                                                                               ## host
    RequestGetProxyHost*: proc (rq: HREQUEST; rcv: ptr LPCSTR_RECEIVER;
                              rcv_param: pointer): REQUEST_RESULT ## # get proxy port
    RequestGetProxyPort*: proc (rq: HREQUEST; pPort: ptr cuint): REQUEST_RESULT ## # mark reequest as complete with status and data 
    RequestSetSucceeded*: proc (rq: HREQUEST; status: cuint; dataOrNull: ptr byte;
                              dataLength: cuint): REQUEST_RESULT ## # mark reequest as complete with failure and optional data 
    RequestSetFailed*: proc (rq: HREQUEST; status: cuint; dataOrNull: ptr byte;
                           dataLength: cuint): REQUEST_RESULT ## # append received data chunk 
    RequestAppendDataChunk*: proc (rq: HREQUEST; data: ptr byte; dataLength: cuint): REQUEST_RESULT ## 
                                                                                          ## # 
                                                                                          ## set 
                                                                                          ## request 
                                                                                          ## header 
                                                                                          ## (single 
                                                                                          ## item)
    RequestSetRqHeader*: proc (rq: HREQUEST; name: ptr WideCString;
                             value: ptr WideCString): REQUEST_RESULT ## # set respone header (single item)
    RequestSetRspHeader*: proc (rq: HREQUEST; name: ptr WideCString;
                              value: ptr WideCString): REQUEST_RESULT ## # get received (so far) data
    RequestGetData*: proc (rq: HREQUEST; rcv: ptr LPCBYTE_RECEIVER; rcv_param: pointer): REQUEST_RESULT

  LPSciterRequestAPI* = ptr SciterRequestAPI
