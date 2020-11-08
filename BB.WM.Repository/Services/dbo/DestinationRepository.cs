using dryve.Entities.DatabaseEntities;
using dryve.Entities.DomainModels;
using dryve.Repository.Interfaces;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using static System.Data.CommandType;

namespace dryve.Repository.Services
{
    public class DestinationRepository : BaseRepository, IDestinationRepository
    {
        #region[vars]
        const string DESTINATION_INSERT = "[dbo].[DestinationInsert]";
        const string DESTINATION_UPDATE_IS_DELETE = "[dbo].[DestinationUpdateIsDelete]";
        const string DESTINATION_GET_BY_ALL = "[dbo].[DestinationGetAll]";
        #endregion

        #region[ctor]
        public DestinationRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {

        }
        #endregion

        #region[action]
        public async Task<bool> Add(DestinationEntity entity)
        {
            try
            {
                Connection = await UnitOfWork.GetConnectionAsync();
                DynamicParameters parameters = new DynamicParameters();

                parameters.Add("@DestinationId", entity.DestinationId);
                parameters.Add("@Name", entity.Name);
                parameters.Add("@IsDeleted", false);

                var affectedRecords = await SqlMapper.ExecuteAsync(Connection, DESTINATION_INSERT, parameters, Transaction, commandType: StoredProcedure).ConfigureAwait(false);
                return affectedRecords == 1;

            }
            catch (AggregateException aggException)
            {
                throw new Exception(aggException.Message);
            }
            catch (SqlException sqlException)
            {
                throw new Exception(sqlException.Message);
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }


        public async Task<bool> UpdateIsDeleted(Guid DestinationId, bool isDeleted)
        {
            try
            {
                Connection = await UnitOfWork.GetConnectionAsync();
                DynamicParameters parameters = new DynamicParameters();

                parameters.Add("@DestinationId", DestinationId);
                parameters.Add("@IsDeleted", isDeleted);

                var affectedRecords = await SqlMapper.ExecuteAsync(Connection, DESTINATION_UPDATE_IS_DELETE, parameters, Transaction, commandType: StoredProcedure).ConfigureAwait(false);
                return affectedRecords == 1;

            }
            catch (AggregateException aggException)
            {
                throw new Exception(aggException.Message);
            }
            catch (SqlException sqlException)
            {
                throw new Exception(sqlException.Message);
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }


        public async Task<IEnumerable<DestinationModel>> GetAll()
        {
            try
            {
                Connection = await UnitOfWork.GetConnectionAsync();

                return await SqlMapper.QueryAsync<DestinationModel>(Connection, DESTINATION_GET_BY_ALL, null, Transaction, commandType: StoredProcedure).ConfigureAwait(false);
            }
            catch (AggregateException aggException)
            {
                throw new Exception(aggException.Message);
            }
            catch (SqlException sqlException)
            {
                throw new Exception(sqlException.Message);
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        #endregion
    }
}
