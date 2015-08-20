module JuliaWebAPI

using ZMQ
using JSON
using Logging
using HttpCommon
using HttpServer
using Compat

export APIResponder, register, process
export APIInvoker, apicall, httpresponse, fnresponse, run_rest

const ERR_CODES = @compat Dict{Symbol, Array}(:success            => [200,  0, ""],
                        :invalid_api        => [404, -1, "invalid api"],
                        :api_exception      => [500, -2, "api exception"],
                        :invalid_data       => [500, -3, "invalid data"],
                        :terminate          => [200, 0,  ""],
                        :dummy              => []
                    )

const CONTROL_CMDS = @compat Dict{Symbol, Array}(:terminate => ["terminate"])

include("APIResponder.jl")
include("APIInvoker.jl")
include("RESTServer.jl")

end # module
